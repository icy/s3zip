#!/usr/bin/env ruby

# Purpose : Create a mess on top of mess
# Author  : Ky-Anh Huynh
# License : MIT
# Date    : 2018 07 30

require 'yaml'
require 'digest'
require 'json'

def inspect_p(p)
  users = p["user"]
  users = [users] if users.is_a?(String) and (users != '*')
  does = p["do"]
  does.each do |dop|
    buckets = (dop["bucket"] || p["bucket"])
    buckets = [buckets] if buckets.is_a?(String)
    paths = dop["path"]
    paths = [paths] if paths.is_a?(String)
    perms = dop["perm"]

    next if buckets.nil?
    next unless buckets.size >= 1
    # Special macros

    w_buckets = buckets.dup
    if %w{READ ALL LIST}.include?(perms)
      new_perms = (perms == "READ" ? ["s3:Get*", "s3:List*"] : ["s3:*"])
      perms = ["s3:ListBucket", "s3:GetBucketLocation"]

      paths = buckets.slice(0,1).map{|bucket| "arn:aws:s3:::#{bucket}"}
      w_buckets = w_buckets.slice(0,1)

      buckets.slice(1,buckets.size).each do |bucket|
        does << {
          "bucket" => [bucket],
          "path" => ["arn:aws:s3:::#{bucket}"],
          "perm" => perms
        }
      end

      if dop["perm"] != "LIST"
        buckets.each do |bucket|
          does << {
            "bucket" => [bucket],
            "path" => [bucket].map{|bucket| "arn:aws:s3:::#{bucket}/*"},
            "perm" => new_perms
          }
        end
      end
    end

    ifs = (dop["if"] || p["if"]).to_s.strip
    w_buckets.each do |bucket|
      pol = {
        "Sid" => "sid_" + Digest::MD5.hexdigest("#{bucket} #{paths} #{perms}#{ifs}"),
        "Effect" => "Allow",
        "Principal" => (users == "*" ? users : {"AWS" => users.sort}),
        "Resource" => paths,
      }
      pol["Action"] = perms unless perms.nil? or perms.empty?
      if not ifs.empty?
        pol["Condition"] = JSON.parse("{#{ifs}}")
      end
      $policies[bucket] ||= {
        "Version" => "2008-10-17",
        "Statement" => []
        }
      pol["Env"] = (dop["env"] || p["env"] || [])
      $envs |= pol["Env"]
      $policies[bucket]["Statement"] << pol
    end
  end
end

class Hash
  def inspect_pol
    inspect_p(self)
  end
end

$policies = {}
$envs = []
y = YAML.load(STDIN)
y.each(&:inspect_pol)
$buckets = $policies.keys
$tf_output = ARGV.include?("--tf")
$ext = ($tf_output ? "tf" : "json")
$d_output = (ENV["D_OUTPUT"].to_s.empty? ? "./" : ENV["D_OUTPUT"].to_s)
$envs.each do |env|
  $buckets.each do |bucket|
    policies = Marshal.load(Marshal.dump($policies[bucket])) # deep_dup =))
    policies["Statement"] = policies["Statement"].select do |statement|
      envs = statement.delete("Env")
      envs.include?(env)
    end

    next if policies["Statement"].empty?

    fancy_bucket_name = "#{env}_#{bucket.gsub(%r|[-.\${}/*]|, "_")}"
    result_json = JSON.pretty_generate(policies)
    result_tf = "#{<<EOF}"
# ENVS: AUTO_GENERATED/{#{env}}
# FILE: #{fancy_bucket_name}_override.tf
# WARNING: Don't change this file manually
resource "aws_s3_bucket_policy" "s3_bucket_policy_#{fancy_bucket_name}" {
  bucket = "#{bucket}"
  policy = <<AUTO_GENERATED
#{result_json}
AUTO_GENERATED
}
EOF

    result = ($tf_output ? result_tf : result_json)

    if ENV["DEBUG"].to_s.empty?
      File.open("#{$d_output}/#{fancy_bucket_name}_override.#{$ext}", "w") do |f|
        f.puts result
      end

      STDERR.puts "Output written to #{$d_output}/#{fancy_bucket_name}_override.#{$ext} for bucket #{bucket}"
    else
      puts result
    end

  end
end

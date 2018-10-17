# ENVS: AUTO_GENERATED/{production}
# FILE: production_some_other_buckets_override.tf
# WARNING: Don't change this file manually
resource "aws_s3_bucket_policy" "s3_bucket_policy_production_some_other_buckets" {
  bucket = "some-other-buckets"

# ~~ WARNING ~~
# This is an inline string examples.
# We can add custom contents to generated Terraform file.

  policy = <<AUTO_GENERATED
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "sid_8af5638b1d4585f98dc9470a4df95e2e",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": [
        "arn:aws:s3:::some-other-buckets/*"
      ],
      "Action": [
        "s3:*"
      ],
      "Condition": {
        "ForAnyValue:StringLike": {
          "aws:userid": [
            "${var.dev_iam_role_Ec2Role_unique_id}*",
            "${var.staging_iam_role_Ec2Role_unique_id}*"
          ]
        }
      }
    },
    {
      "Sid": "sid_ee771c8c716636d4875a192bf6d9c4a2",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": [
        "arn:aws:s3:::some-other-buckets"
      ],
      "Action": [
        "s3:ListBucket",
        "s3:GetBucketLocation"
      ],
      "Condition": {
        "ForAnyValue:StringLike": {
          "aws:userid": [
            "${var.dev_iam_role_Ec2Role_unique_id}*",
            "${var.staging_iam_role_Ec2Role_unique_id}*"
          ]
        }
      }
    }
  ]
}
AUTO_GENERATED
}

[![Build Status](https://travis-ci.org/icy/s3zip.svg?branch=master)](https://travis-ci.org/icy/s3zip)

## TOC

* [Description](#description)
* [Examples](#examples)
* [Installation](#installation)
* [Syntax](#syntax)
* [Why-s3zip](#why-s3zip)
* [Specification](#specification)

## Description

Compress AWS S3 policies and make them maintainable for human being.

Compress 1200 lines of Json files into 120 lines of configuration.

Output in JSON and/or Terraform.
See input examples in `input/` and the output in `output/`.

Please don't use this tool if you are not a human.

## Examples

See more in [Examples](examples/) directory.

Input policy:

```
- user: "arn:aws:iam::${var.example_production_account_id}:root"
  env: [dev]
  do:
  - perm: ALL
    bucket: ["${aws_s3_bucket.some_bucket_for_production.id}"]
```

Output `Terraform` files

```
# ENVS: AUTO_GENERATED/{dev}
# FILE: dev___aws_s3_bucket_some_bucket_for_production_id__override.tf
# WARNING: Don't change this file manually
resource "aws_s3_bucket_policy" "s3_bucket_policy_dev___aws_s3_bucket_some_bucket_for_production_id_" {
  bucket = "${aws_s3_bucket.some_bucket_for_production.id}"
  policy = <<AUTO_GENERATED
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "sid_333688ecda60fc955939b673acb26913",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::${var.example_production_account_id}:root"
        ]
      },
      "Resource": [
        "arn:aws:s3:::${aws_s3_bucket.some_bucket_for_production.id}"
      ],
      "Action": [
        "s3:ListBucket",
        "s3:GetBucketLocation"
      ]
    },
    {
      "Sid": "sid_2bc1a7835a0e262abb3009a8d3e5518c",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::${var.example_production_account_id}:root"
        ]
      },
      "Resource": [
        "arn:aws:s3:::${aws_s3_bucket.some_bucket_for_production.id}/*"
      ],
      "Action": [
        "s3:*"
      ]
    }
  ]
}
AUTO_GENERATED
}

```

## Installation

A standard `Ruby` installation is required.

Make the script `s3zip` executable and put them to your search path.
We may have `gem` support in the future.

## Syntax

Write Terraform files

```
$ cat input/*.tf.in \
  | D_OUTPUT="./output/" ruby s3zip.rb --tf
```

or simple the json files

```
$ cat input/*.tf.in \
  | D_OUTPUT="./output/" ruby s3zip.rb
```

## Why s3zip

It's because number of users of your `s3` bucket(s) is
often higher than number of buckets.
This is clear: Every bucket needs at least one user.

Let's say you have two buckets `s31` and `s32`, and you have several users:

* Two developers in your company (`u1`, `u2`)
* Two applications need to write to those buckets (`a1`, `a2`)
* A backup application to read from those buckets (`b1`)

To prepare `s3` policies for this setup, you often do as below

* Prepare configuration for `s31` bucket: You need `IAM` information of
  5 users (`u1`, `u2`, `a1`, `a2`, `b1`) and write policies for them.
  In the policy you have to provide `IAM` information for each action
  that would happen on the bucket. There are many code duplication.
* Prepare configuration for `s32` bucket. You almost repeat what you
  have done for `s31` with a few updates.

One day your audit guy comes and asks you a list of buckets that
the developer `u1` may have access. The only option you can think of
is to rescan all your policies. That's a nightmare.


`S3zip` helps you from the point of view of an audit guy. Instead of
writing policies for each bucket, we will write policies for each user.
For each `IAM` user on your system (maybe that's a human, or an application)
you describe some basic rules for them.

Take a look at `input/` directory for some examples.

Problem solved. Code duplication is reduced quickly, policies are very
clean and your audit guy will be happy.

## Specification

Specification is found [here](./SPECIFICATION.md).

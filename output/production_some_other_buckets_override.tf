# ENVS: AUTO_GENERATED/{production}
# FILE: production_some_other_buckets_override.tf
# WARNING: Don't change this file manually
resource "aws_s3_bucket_policy" "s3_bucket_policy_production_some_other_buckets" {
  bucket = "some-other-buckets"
  policy = <<AUTO_GENERATED
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "sid_6bd1d6f4cb5b82c85b19f7df96d39085",
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
    },
    {
      "Sid": "sid_f005d2ad1f594b661af410bc89db0507",
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
    }
  ]
}
AUTO_GENERATED
}

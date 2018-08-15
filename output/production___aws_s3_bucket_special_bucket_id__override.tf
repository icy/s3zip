# ENVS: AUTO_GENERATED/{production}
# FILE: production___aws_s3_bucket_special_bucket_id__override.tf
# WARNING: Don't change this file manually
resource "aws_s3_bucket_policy" "s3_bucket_policy_production___aws_s3_bucket_special_bucket_id_" {
  bucket = "${aws_s3_bucket.special_bucket.id}"
  policy = <<AUTO_GENERATED
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "sid_19cf39dd73361e12153c794bacf9fae7",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": [
        "arn:aws:s3:::${aws_s3_bucket.special_bucket.id}"
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
      "Sid": "sid_640398036d32a878e5317f24d323e3d0",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": [
        "${aws_s3_bucket.some_bucket_for_production.arn}/foo/*"
      ],
      "Action": [
        "s3:Put*",
        "s3:Get*"
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
      "Sid": "sid_4cd133790300120921c9c27f787ea75f",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": [
        "arn:aws:s3:::${aws_s3_bucket.special_bucket.id}/*"
      ],
      "Action": [
        "s3:Get*",
        "s3:List*"
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

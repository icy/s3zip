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
      "Sid": "sid_8bd0181a481a8e2e66bcd045261029e3",
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
      "Sid": "sid_cb103e9d507883dbc87e5e1655b31498",
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

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
    },
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
    }
  ]
}
AUTO_GENERATED
}

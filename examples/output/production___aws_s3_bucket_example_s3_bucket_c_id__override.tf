# ENVS: AUTO_GENERATED/{production}
# FILE: production___aws_s3_bucket_example_s3_bucket_c_id__override.tf
# WARNING: Don't change this file manually
resource "aws_s3_bucket_policy" "s3_bucket_policy_production___aws_s3_bucket_example_s3_bucket_c_id_" {
  bucket = "${aws_s3_bucket.example_s3_bucket_c.id}"
  policy = <<AUTO_GENERATED
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "sid_dc61b41ec7bf669d27d963d77d1c9098",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::${var.production_account_id}:role/AthenaPowerUsers",
          "arn:aws:iam::${var.production_account_id}:user/george@example.us",
          "arn:aws:iam::${var.production_account_id}:user/laura@example.us",
          "arn:aws:iam::${var.production_account_id}:user/mike@example.us"
        ]
      },
      "Resource": [
        "arn:aws:s3:::${aws_s3_bucket.example_s3_bucket_c.id}/*"
      ],
      "Action": [
        "s3:Get*",
        "s3:List*"
      ]
    },
    {
      "Sid": "sid_fc9d7c0429ce761082e8d84eaef582e1",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::${var.production_account_id}:role/AthenaPowerUsers",
          "arn:aws:iam::${var.production_account_id}:user/george@example.us",
          "arn:aws:iam::${var.production_account_id}:user/laura@example.us",
          "arn:aws:iam::${var.production_account_id}:user/mike@example.us"
        ]
      },
      "Resource": [
        "arn:aws:s3:::${aws_s3_bucket.example_s3_bucket_c.id}"
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

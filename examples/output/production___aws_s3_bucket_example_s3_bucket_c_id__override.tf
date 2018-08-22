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
      "Sid": "sid_ce4f14d6580f1e617e62bf09b327088e",
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
    },
    {
      "Sid": "sid_eae53769e1fb5f1a1c5823fceb80f766",
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
    }
  ]
}
AUTO_GENERATED
}

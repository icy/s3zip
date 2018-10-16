# ENVS: AUTO_GENERATED/{production}
# FILE: production___aws_s3_bucket_example_s3_bucket_a_id__override.tf
# WARNING: Don't change this file manually
resource "aws_s3_bucket_policy" "s3_bucket_policy_production___aws_s3_bucket_example_s3_bucket_a_id_" {
  bucket = "${aws_s3_bucket.example_s3_bucket_a.id}"
  policy = <<AUTO_GENERATED
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "sid_c16ca8625a919dd7c9f49d1a4c833951",
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
        "arn:aws:s3:::${aws_s3_bucket.example_s3_bucket_a.id}/*"
      ],
      "Action": [
        "s3:Get*",
        "s3:List*"
      ]
    },
    {
      "Sid": "sid_def0be6f61656646ad0798790a01a819",
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
        "arn:aws:s3:::${aws_s3_bucket.example_s3_bucket_a.id}"
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

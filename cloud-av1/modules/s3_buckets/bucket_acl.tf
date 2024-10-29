resource "aws_s3_bucket_acl" "bucket_logs_acl" {
  bucket = aws_s3_bucket.bucket_logs.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_acl" "bucket_local_acl" {
  bucket = aws_s3_bucket.bucket_local.id
  acl    = "private"
}

resource "aws_s3_bucket_acl" "bucket_bronze_acl" {
  bucket = aws_s3_bucket.bucket_bronze.id
  acl    = "private"
}

resource "aws_s3_bucket_acl" "bucket_silver_acl" {
  bucket = aws_s3_bucket.bucket_silver.id
  acl    = "private"
}

resource "aws_s3_bucket_acl" "bucket_gold_acl" {
  bucket = aws_s3_bucket.bucket_gold.id
  acl    = "public-read"
}
resource "aws_s3_bucket_logging" "bucket_local_logging" {
  bucket = aws_s3_bucket.bucket_local.id

  target_bucket = aws_s3_bucket.bucket_logs.id 
  target_prefix = "logs/" 
}
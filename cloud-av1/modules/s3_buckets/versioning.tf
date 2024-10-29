resource "aws_s3_bucket_versioning" "local_versioning" {
    bucket = aws_s3_bucket.bucket_local.id
    versioning_configuration {
        status = var.enable_versioning
    }
}
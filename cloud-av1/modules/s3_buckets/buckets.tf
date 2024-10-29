resource "aws_s3_bucket" "bucket_logs" {
  bucket = var.logs_local_bucket
}

resource "aws_s3_bucket" "bucket_local" {
  bucket = var.local_bucket_name

  tags = {
    Name        = "bucket-local-files"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "bucket_bronze" {
  bucket = var.bronze_bucket_name

  tags = {
    Name        = "bucket-bronze-files"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "bucket_silver" {
  bucket = var.silver_bucket_name

  tags = {
    Name        = "bucket-silver-files"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "bucket_gold" {
  bucket = var.gold_bucket_name

  tags = {
    Name        = "bucket-gold-files"
    Environment = "Dev"
  }
}
output "local_bucket_arn" {
  description = "ARN do bucket S3 para armazenamento de arquivos locais"
  value       = aws_s3_bucket.bucket_local.arn
}

output "bronze_bucket_arn" {
  description = "ARN do bucket S3 para dados brutos"
  value       = aws_s3_bucket.bucket_bronze.arn
}

output "silver_bucket_arn" {
  description = "ARN do bucket S3 para dados parcialmente processados"
  value       = aws_s3_bucket.bucket_silver.arn
}

output "gold_bucket_arn" {
  description = "ARN do bucket S3 para dados finais"
  value       = aws_s3_bucket.bucket_gold.arn
}

output "local_bucket_id" {
  description = "ID do bucket S3 para armazenamento de arquivos locais"
  value       = aws_s3_bucket.bucket_local.id
}

output "bronze_bucket_id" {
  description = "ID do bucket S3 para dados brutos"
  value       = aws_s3_bucket.bucket_bronze.id
}

output "silver_bucket_id" {
  description = "ID do bucket S3 para dados parcialmente processados"
  value       = aws_s3_bucket.bucket_silver.id
}

output "gold_bucket_id" {
  description = "ID do bucket S3 para dados finais"
  value       = aws_s3_bucket.bucket_gold.id
}

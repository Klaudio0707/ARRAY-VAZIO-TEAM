# Definição dos Buckets S3

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "local_files" {
  bucket = "local-vitorarrayvazio"
}

resource "aws_s3_bucket" "bronze" {
  bucket = "bronze-vitorarrayvazio"
}

resource "aws_s3_bucket" "silver" {
  bucket = "silver-vitorarrayvazio"
}

resource "aws_s3_bucket" "gold" {
  bucket = "gold-vitorarrayvazio"
}

# processo de versionamento de buckets
resource "aws_s3_bucket_versioning" "local_files_versioning" {
  bucket = aws_s3_bucket.local_files.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "bronze_versioning" {
  bucket = aws_s3_bucket.bronze.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "silver_versioning" {
  bucket = aws_s3_bucket.silver.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "gold_versioning" {
  bucket = aws_s3_bucket.gold.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

# notificação SNS
resource "aws_sns_topic" "file_upload_notifications" {
  name = "file-upload-notifications-topic"
}

# permissão de notificações do S3
resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn    = aws_sns_topic.file_upload_notifications.arn
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "sns:Publish",
        Resource  = aws_sns_topic.file_upload_notifications.arn,
        Condition = {
          ArnLike = {
            "aws:SourceArn": [
              aws_s3_bucket.bronze.arn,
              aws_s3_bucket.silver.arn,
              aws_s3_bucket.gold.arn
            ]
          }
        }
      }
    ]
  })
}

# Fila SQS

resource "aws_sqs_queue" "file_upload_queue" {
  name = "file-upload-queue"
}

#fila SQS no tópico SQS
resource "aws_sns_topic_subscription" "sqs_subscription" {
  topic_arn = aws_sns_topic.file_upload_notifications.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.file_upload_queue.arn
}

# SNS message to SQS

resource "aws_sqs_queue_policy" "sqs_policy" {
  queue_url = aws_sqs_queue.file_upload_queue.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "sqs:SendMessage"
        Resource = aws_sqs_queue.file_upload_queue.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn": aws_sns_topic.file_upload_notifications.arn
          }
        }
      }
    ]
  })
}

# eventos do s3 para ativar o SNS quando for adicionado novos arquivos

resource "aws_s3_bucket_notification" "bronze_notification" {
  bucket = aws_s3_bucket.bronze.id
  topic {
    topic_arn = aws_sns_topic.file_upload_notifications.arn
    events    = ["s3:ObjectCreated:*"]
  }
  depends_on = [aws_sns_topic_policy.sns_topic_policy]
}

resource "aws_s3_bucket_notification" "silver_notification" {
  bucket = aws_s3_bucket.silver.id
  topic {
    topic_arn = aws_sns_topic.file_upload_notifications.arn
    events    = ["s3:ObjectCreated:*"]
  }
  depends_on = [aws_sns_topic_policy.sns_topic_policy]
}

resource "aws_s3_bucket_notification" "gold_notification" {
  bucket = aws_s3_bucket.gold.id
  topic {
    topic_arn = aws_sns_topic.file_upload_notifications.arn
    events    = ["s3:ObjectCreated:*"]
  }
  depends_on = [aws_sns_topic_policy.sns_topic_policy]
}








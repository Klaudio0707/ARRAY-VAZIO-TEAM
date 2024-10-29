resource "aws_sns_topic_subscription" "sns_to_sqs" {
  topic_arn = var.sns_topic_arn
  protocol  = "sqs"
  endpoint  = var.sqs_queue_arn

  depends_on = [var.sqs_policy_id]
}

resource "aws_s3_bucket_notification" "bronze_notification" {
    bucket = var.bronze_bucket_id

    topic {
        topic_arn = var.sns_topic_arn
        events = ["s3:ObjectCreated:*"]
    }
}

resource "aws_s3_bucket_notification" "silver_notification" {
    bucket = var.silver_bucket_id

    topic {
        topic_arn = var.sns_topic_arn
        events = ["s3:ObjectCreated:*"]
    }
}

resource "aws_s3_bucket_notification" "gold_notification" {
    bucket = var.gold_bucket_id

    topic {
        topic_arn = var.sns_topic_arn
        events = ["s3:ObjectCreated:*"]
    }
}
# Provedor AWS
provider "aws" {
  region = "sa-east-1"  # Especifique sua região aqui
}

module "buckets" {
  source = "./modules/s3_buckets"

  local_bucket_name   = "local-files-bucket"
  bronze_bucket_name  = "bronze-bucket"
  silver_bucket_name  = "silver-bucket"
  gold_bucket_name    = "gold-bucket"
  logs_local_bucket   = "logs-local-bucket"
  enable_versioning   = "Enabled"
}

module "topic" {
  source = "./modules/sns_topics"
}

module "sqs_queues" {
  source = "./modules/sqs_queues"
  sns_topic_id = module.topic.sns_topic_id
}

module "notifications" {
  source = "./modules/notifications"

  sns_topic_arn    = module.topic.sns_topic_arn
  sqs_queue_arn    = module.sqs_queues.queue_arn
  sqs_policy_id    = module.sqs_queues.notifications_policy_id
  bronze_bucket_id = module.buckets.bronze_bucket_id
  silver_bucket_id = module.buckets.silver_bucket_id
  gold_bucket_id   = module.buckets.gold_bucket_id
}
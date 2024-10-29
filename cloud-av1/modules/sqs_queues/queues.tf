resource "aws_sqs_queue" "sqs_notifications_queue" {
  name = "file-notifications-queue"
}
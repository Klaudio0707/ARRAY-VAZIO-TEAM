output "sns_topic_id" {
    description = "ID do tópico SNS para envio de mensagens"
    value = aws_sns_topic.sns_file_notifications.id
}

output "sns_topic_arn" {
    description = "ID do tópico SNS para envio de mensagens"
    value = aws_sns_topic.sns_file_notifications.arn
}
output "queue_arn" {
    description = "ARN da queue para apresentação das mensagens"
    value       = aws_sqs_queue.sqs_notifications_queue.arn
}

output "queue_id" {
    description = "ID da queue para apresentação das mensagens"
    value       = aws_sqs_queue.sqs_notifications_queue.id
}

output "notifications_policy_id" {
    description = "Política de permissão para envio de mensagens vindas de um tópico SNS à uma fila SQS"
    value       = aws_sqs_queue_policy.sqs_notifications_queue_policy.id
}
variable "sns_topic_arn" {
    description = "Arn do tópico SNS que enviará as mensagens à fila"
    type        = string
}

variable "sqs_queue_arn" {
    description = "Arn da fila que receberá as mensagens"
    type        = string
}

variable "sqs_policy_id" {
    description = "Id da política sqs que permite o recebimento de mensagens vindas de um tópico sns"
    type        = string
}

variable "bronze_bucket_id" {
    description = "Id do bucket bronze que será observado"
    type        = string
}

variable "silver_bucket_id" {
    description = "Id do bucket silver que será observado"
    type        = string
}

variable "gold_bucket_id" {
    description = "Id do bucket gold que será observado"
    type        = string
}
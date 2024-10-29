variable "local_bucket_name" {
  description = "Nome do bucket S3 para armazenamento de arquivos locais"
  type        = string
}

variable "bronze_bucket_name" {
  description = "Nome do bucket S3 para dados brutos"
  type        = string
}

variable "silver_bucket_name" {
  description = "Nome do bucket S3 para dados parcialmente processados"
  type        = string
}

variable "gold_bucket_name" {
  description = "Nome do bucket S3 para dados finais"
  type        = string
}

variable "logs_local_bucket" {
    description = "Nome do bucket s3 para armazenar logs do bucket local"
    type        = string
}

variable "enable_versioning" {
  description = "Define se o versionamento deve estar ativado nos buckets"
  type        = string
  default     = "Enabled"
}

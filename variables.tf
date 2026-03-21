##############################################
# OpenSearch - Core Configuration
##############################################

variable "domain_name" {
  description = "Nome do domínio OpenSearch"
  type        = string
}

variable "engine_version" {
  description = "Versão do OpenSearch"
  type        = string
  default     = "OpenSearch_2.11"
}

variable "instance_type" {
  description = "Tipo da instância OpenSearch"
  type        = string
  default     = "t3.small.search"
}

variable "instance_count" {
  description = "Quantidade de nós de dados"
  type        = number
  default     = 1
}

##############################################
# Storage (EBS)
##############################################

variable "ebs_enabled" {
  description = "Habilita armazenamento EBS"
  type        = bool
  default     = true
}

variable "ebs_volume_size" {
  description = "Tamanho do volume EBS em GB"
  type        = number
  default     = 10
}

variable "ebs_volume_type" {
  description = "Tipo do volume EBS"
  type        = string
  default     = "gp3"
}

##############################################
# CloudWatch Logs
##############################################

variable "cloudwatch_log_retention_in_days" {
  description = "Retenção dos logs no CloudWatch"
  type        = number
  default     = 7
}

variable "cloudwatch_kms_key_id" {
  description = "KMS Key ID para criptografia dos logs do CloudWatch (opcional)"
  type        = string
  default     = null
}

variable "enable_index_slow_logs" {
  description = "Habilita logs de indexação lenta"
  type        = bool
  default     = true
}

variable "enable_search_slow_logs" {
  description = "Habilita logs de busca lenta"
  type        = bool
  default     = true
}

variable "enable_application_logs" {
  description = "Habilita logs de aplicação"
  type        = bool
  default     = true
}

variable "enable_audit_logs" {
  description = "Habilita audit logs (necessita FGAC)"
  type        = bool
  default     = false
}

##############################################
# Security / Access Policy
##############################################

variable "access_policies" {
  description = "Policy JSON do domínio OpenSearch. Se null, será possível usar data source para gerar automaticamente."
  type        = string
  default     = null
}

##############################################
# Network (Futuro uso com VPC)
##############################################

variable "subnet_ids" {
  description = "Lista de subnets para implantação em VPC (opcional)"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Lista de security groups para OpenSearch (opcional)"
  type        = list(string)
  default     = []
}

variable "use_vpc" {
  description = "Define se o OpenSearch será criado dentro de uma VPC"
  type        = bool
  default     = false
}

##############################################
# Tags
##############################################

variable "tags" {
  description = "Tags aplicadas aos recursos"
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
  }
}
variable "aws_region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "role_name" {
  description = "Nome da IAM Role"
  type        = string
  default     = "data-engineering-role"
}
variable "policy_name" {
  description = "Nome da IAM Policy"
  type        = string
  default     = "data-engineering-policy"
}
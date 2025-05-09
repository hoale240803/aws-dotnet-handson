variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "aws_availability_zone" {
  description = "AWS availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "container_image" {
  description = "Container image for ECS task"
  type        = string
  default     = "nginx:latest"
}

variable "db_username" {
  description = "Username for RDS PostgreSQL"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Password for RDS PostgreSQL"
  type        = string
  sensitive   = true
}

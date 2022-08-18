variable "aws_profile" {
  type = string
}

variable "environment" {
  type = string
}

variable "infra_maintainer" {
  type        = string
  description = "infra_maintainer tag"
}

variable "app_maintainer" {
  type        = string
  description = "app_maintainer tag"
}

variable "shared_resource" {
  type        = bool
  description = "shared_resource tag"
  default     = true
}

variable "configured_by" {
  type        = string
  description = "configured_by tag"
}

variable "app_name" {
  type = string
}

variable "os_distribution" {
  type        = string
  description = "os_distribution tag to allow ansible identify operating system distribution of this ec2 instances"
}

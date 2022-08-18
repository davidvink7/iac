variable "aws_profile" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "prod" {
  description = "Production"
  default     = false
}

variable "ec2_key_name" {
  description = "EC2 Key Pair Name"
}

variable "dev_whitelist_service" {
  description = "DEV: List of CIDRs with access to internal api"
  type        = list(string)
  default = [
    "0.0.0.0/0", #All public networks
  ]
}

variable "dev_whitelist_asg_ssh" {
  description = "DEV: List of CIDRs with access to asg servers"
  type        = list(string)
  default = [
    "${PASTE_BASTION_IP_HERE}", # Bastion subnet CIDR
  ]
}

variable "prod_whitelist_service" {
  description = "PROD: List of CIDRs with access to internal api"
  type        = list(string)
  default = [
    "0.0.0.0/0", #All public networks
  ]
}

variable "prod_whitelist_asg_ssh" {
  description = "PROD: List of CIDRs with access to asg servers"
  type        = list(string)
  default = [
    "${PASTE_BASTION_IP_HERE}", # Bastion subnet CIDR
  ]
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

variable "vpc_id" {
  type        = string
  description = "(optional) The VPC ID to use"
}

variable "subnet_id_1a" {
  description = "(optional) The private subnet ID to use"
}

variable "subnet_id_1b" {
  description = "(optional) The private subnet ID to use"
}

variable "subnet_id_1c" {
  description = "(optional) The private subnet ID to use"
}

variable "subnet_id_1a_public" {
  description = "(optional) The public subnet ID to use"
}

variable "subnet_id_1b_public" {
  description = "(optional) The public subnet ID to use"
}

variable "subnet_id_1c_public" {
  description = "(optional) The public subnet ID to use"
}

variable "availability_zone" {
  type        = string
  description = "(Required) The AZ where the EBS volume will exist."
}

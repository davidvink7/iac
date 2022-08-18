variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "app_name" {
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

variable "configured_by" {
  type        = string
  description = "configured_by tag"
}

variable "shared_resource" {
  type        = string
  description = "shared_resource tag"
  default     = true
}

variable "vpc_id" {
  type = string
}

variable "rbd_volume_size" {
  type = string
}

variable "rbd_volume_type" {
  type = string
}

variable "ec2_instance_type" {
  type        = string
  description = "Instance type"
}

variable "key_name" {
  type        = string
  description = "SSH key to use for the default user"
}

variable "subnet_ids_public" {
  type        = list(any)
  description = "subnet_ids_public to create instances"
}

variable "secgroup_name" {
  type        = string
  description = "Security Group resource name"
}

variable "allowed_hosts" {
  type        = map(string)
  description = "CIDR blocks of trusted networks"
}

variable "allowed_networks" {
  type        = list(string)
  description = "CIDR blocks of trusted external networds"
}

variable "ami_id" {
  type        = string
  description = "AMI ID"
}

variable "aws_profile" {
  type = string
}

variable "prod" {
  description = "Production"
  default     = false
}

variable "ec2_key_name" {
  description = "EC2 Key Pair Name"
}

variable "ami_id" {
  type = string
}

variable "dev_whitelist_setup_ssh" {
  description = "DEV: List of CIDRs with access to setup servers"
  type        = list(string)
  default = [
    "${PASTE_BASTION_IP_HERE}", # Bastion subnet CIDR
  ]
}


variable "prod_whitelist_internalapi" {
  description = "PROD: List of CIDRs with access to internal api"
  type        = list(string)
  default     = []
}

variable "prod_whitelist_vault_access" {
  description = "PROD: List of CIDRs with access to vault server"
  type        = list(string)
  default     = []
}
variable "prod_whitelist_setup_ssh" {
  description = "PROD: List of CIDRs with access to setup servers"
  type        = list(string)
  default     = []
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

variable "ec2_instance_type" {
  type        = string
  description = "(required) The EC2 instance type to use"
}

variable "ec2_image_arch" {
  type        = string
  description = "(required) architecture for ec2 instance"
}

variable "ec2_image_prefix" {
  type        = string
  description = "(required) prefix for ec2 image"
}

variable "nodejs_version" {
  type        = string
  description = "(required) nodejs_version to select ec2 image"
}

variable "app_group" {
  type        = string
  description = "(required) app_group to select ec2 image"
}

variable "ebs_optimized" {
  description = "This optimization provides the best performance for your EBS volumes"
  type        = bool
  default     = false
}

variable "rbd_device_name" {
  type        = string
  description = "(required) The EBS volume device name to mount on the instance"
}

variable "rbd_volume_size" {
  type        = string
  description = "(required) The root block device volume size to use"
}

variable "rbd_volume_type" {
  type        = string
  description = "(required) The root block device volume type to use"
}

variable "rbd_encrypted" {
  type        = bool
  description = "ebs block device - encryption"
  default     = true
}

variable "ebs_device_name" {
  type        = string
  description = "(required) The EBS volume device name to mount on the instance"
}

variable "ebs_volume_size" {
  type        = string
  description = "(required) The size of the EBS volume to create in GiB"
}

variable "ebs_volume_type" {
  type        = string
  description = "(required) The type of EBS volume to create"
}

variable "ebs_encrypted" {
  type        = bool
  description = "ebs block device - encryption"
  default     = true
}

variable "enable_monitoring" {
  type        = bool
  description = "Enables/disables detailed monitoring	"
  default     = true
}

## ACM
variable "acm_certificate_arn" {
  type        = string
  description = "acm_certificate_arn"
}


## AWS Route53
variable "route53_zones_ids" {
  type        = map(any)
  description = "AWS zone Ids"
}

variable "route53_zone_name" {
  type        = string
  description = "DNS zone,  mydomainexample.com"
}

variable "record_type" {
  type        = string
  description = "DNS type,  CNAME/A"
}

variable "record_ttl" {
  type        = number
  description = "Route53 DNS Record TTL"
  default     = 60
}

variable "alb_route53_company-name_record_name" {
  type        = string
  description = "Route53 DNS name for Recharge"
}

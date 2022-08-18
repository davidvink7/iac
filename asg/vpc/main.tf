terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = var.aws_profile
  default_tags {
    tags = {
      Component = "devops-iac"
    }
  }
}

data "aws_caller_identity" "current" {}
locals {
  account_id = data.aws_caller_identity.current.account_id
}

data "http" "myip" {
  url = "http://icanhazip.com"
}

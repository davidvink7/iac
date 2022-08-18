terraform {
  backend "s3" {
    profile = "prod"
    region  = "us-east-1"
    bucket  = "${PASTE_ACCOUNT_ID_HERE}-us-east-1-terraform-states"
    key     = "devops-iac/production/services/iam/terraform.tfstate"
  }
}

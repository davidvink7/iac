locals {
  # public_zone_id = var.route53_zones_ids["Public"]

  terraform_tags = {
    "company-name:environment-type"       = "production"
    "company-name:managed-by"             = "terraform"
    "company-name:application"            = "bastion"
    "company-name:infra-maintainer"       = "devops"
    "company-name:application-maintainer" = "devops"
    "company-name:shared-resource"        = false
    "company-name:configured-by"          = "ansible"
    "company-name:os-distribution"        = "ubuntu"
  }
  eip_tags = {
    "company-name:managed-by"  = "terraform"
    "company-name:application" = "bastion"
    #"company-name:test-tag"    = "test" # for testing to add and remove tag
  }

  rbd_tags = {
    "company-name:managed-by" = "terraform"
    "company-name:used-by"    = "bastion"
  }

}

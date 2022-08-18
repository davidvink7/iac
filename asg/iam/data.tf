locals {

  # Common tags to be assigned to all resources
  terraform_tags = {
    "company-name:environment-type"       = var.environment
    "company-name:managed-by"             = "terraform"
    "company-name:application"            = var.app_name
    "company-name:infra-maintainer"       = var.infra_maintainer
    "company-name:application-maintainer" = var.app_maintainer
    "company-name:shared-resource"        = var.shared_resource
    "company-name:configured-by"          = var.configured_by
  }


  terraform_asg_common_tags = [
    {
      key                 = "company-name:environment-type"
      value               = var.environment
      propagate_at_launch = true
    },
    {
      key                 = "company-name:managed-by"
      value               = "terraform"
      propagate_at_launch = true
    },
    {
      key                 = "company-name:application"
      value               = var.app_name
      propagate_at_launch = true
    },
    {
      key                 = "company-name:infra-maintainer"
      value               = var.infra_maintainer
      propagate_at_launch = true
    },
    {
      key                 = "company-name:application-maintainer"
      value               = var.app_maintainer
      propagate_at_launch = true
    },
    {
      key                 = "company-name:shared-resource"
      value               = var.shared_resource
      propagate_at_launch = true
    },
    {
      key                 = "company-name:configured-by"
      value               = var.configured_by
      propagate_at_launch = true
    },
    {
      key                 = "company-name:os-distribution"
      value               = var.os_distribution
      propagate_at_launch = true
    }
  ]


}

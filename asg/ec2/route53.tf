# ROUTE53 RECORDS

module "records" {
  source = "terraform-aws-modules/route53/aws//modules/records"
  #version = "~> 2.0"

  #  zone_name = local.zone_name
  #  zone_id = local.zone_id
  zone_id = local.public_zone_id

  records = [
    {
      name = var.alb_route53_company-name_record_name
      type = var.record_type
      alias = {
        name    = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    }
  ]

}

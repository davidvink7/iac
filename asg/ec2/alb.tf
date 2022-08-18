module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "7.0.0"

  name = "${var.app_name}-${var.environment}-alb"

  load_balancer_type = "network"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets = [
    data.terraform_remote_state.vpc.outputs.aws_subnet_service-1a-alb_id,
    data.terraform_remote_state.vpc.outputs.aws_subnet_service-1b-alb_id,
    data.terraform_remote_state.vpc.outputs.aws_subnet_service-1c-alb_id
  ]
  # security_groups = [data.terraform_remote_state.vpc.outputs.aws_security_group_sg-lb_id]

  # access_logs = {
  #   bucket = var.s3_access_logs_alb_name
  # }

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "TCP"
      backend_port     = 5000
      target_type      = "instance"
    },
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "TLS"
      certificate_arn    = var.acm_certificate_arn
      target_group_index = 0
    },
  ]

  tags = merge(
    local.terraform_tags,
    {
      Name = "${var.app_name}-${var.environment}-alb"
    },
  )

}

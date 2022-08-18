resource "aws_security_group" "sg-lb" {
  name        = "${var.app_name}-${var.environment}-sg-lb"
  description = "${var.app_name}-${var.environment}-sg-lb - LoadBalancer"
  vpc_id      = data.aws_vpc.myvpc.id

  ingress {
    description = "HTTPS - Internal"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.prod ? var.prod_whitelist_service : var.dev_whitelist_service
  }

  ingress {
    description = "TCP - 5000"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = var.prod ? var.prod_whitelist_service : var.dev_whitelist_service
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.terraform_tags,
    {
      Name = "${var.app_name}-${var.environment}-sg-lb"
    },
  )

}

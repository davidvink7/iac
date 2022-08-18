resource "aws_security_group" "instance-sg-asg" {
  name        = "${var.app_name}-${var.environment}-sg-asg"
  description = "${var.app_name}-${var.environment} - Server asg"
  vpc_id      = data.aws_vpc.myvpc.id

  ingress {
    description = "whitelisted asg ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = distinct(concat(var.prod ? var.prod_whitelist_asg_ssh : var.dev_whitelist_asg_ssh))
  }

  ingress {
    description     = "HTTPS"
    from_port       = 443
    to_port         = 443
    protocol        = "TLS"
    security_groups = [aws_security_group.sg-lb.id]
  }

  ingress {
    description     = "TLS - 5000"
    from_port       = 5000
    to_port         = 5000
    protocol        = "TLS"
    security_groups = [aws_security_group.sg-lb.id]
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
      Name = "${var.app_name}-${var.environment}-sg-asg"
    },
  )

}

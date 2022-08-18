resource "aws_security_group" "secgroup" {

  name        = var.secgroup_name
  description = "Allow SSH and app ports from internal networks"
  vpc_id      = var.vpc_id


  tags = merge(
    local.terraform_tags,
    {
      Name = var.secgroup_name
    },
  )

}

resource "aws_security_group_rule" "ssh" {
  for_each          = var.allowed_hosts
  protocol          = "TCP"
  from_port         = 22
  to_port           = 22
  type              = "ingress"
  description       = each.value
  cidr_blocks       = [each.key]
  security_group_id = aws_security_group.secgroup.id
}

resource "aws_security_group_rule" "internet" {
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.secgroup.id
  description       = "internet"
}

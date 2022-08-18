output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(data.aws_vpc.myvpc.*.id, [""])[0]
}

# Subnet instance-1a-asg
output "aws_subnet_instance-1a-asg_id" {
  description = "List of IDs of instance-1a-asg subnets"
  value       = data.aws_subnet.instance-1a-asg.*.id[0]
}

# Subnet instance-1b-asg
output "aws_subnet_instance-1b-asg_id" {
  description = "List of IDs of instance-1b-asg subnets"
  value       = data.aws_subnet.instance-1b-asg.*.id[0]
}

# Subnet instance1c-asg
output "aws_subnet_instance-1c-asg_id" {
  description = "List of IDs of instance-1c-asg subnets"
  value       = data.aws_subnet.instance-1c-asg.*.id[0]
}

# Subnet service-1a-alb
output "aws_subnet_service-1a-alb_id" {
  description = "List of IDs of service-1a-alb subnets"
  value       = data.aws_subnet.service-1a-alb.*.id[0]
}

# Subnet service-1b-alb
output "aws_subnet_service-1b-alb_id" {
  description = "List of IDs of service-1b-alb subnets"
  value       = data.aws_subnet.service-1b-alb.*.id[0]
}

# Subnet service-1c-alb
output "aws_subnet_service-1c-alb_id" {
  description = "List of IDs of service-1c-alb subnets"
  value       = data.aws_subnet.service-1c-alb.*.id[0]
}

# Security Groups
output "aws_security_group_sg-asg_id" {
  description = "The ID of the security group"
  value = concat(
    aws_security_group.instance-sg-asg.*.id,
    [""],
  )[0]
}

output "aws_security_group_sg-lb_id" {
  description = "The ID of the security group"
  value = concat(
    aws_security_group.sg-lb.*.id,
    [""],
  )[0]
}

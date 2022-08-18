output "aws_iam_role_instance-aws-app-asg_arn" {
  description = "ARN of instance-aws-app-asg IAM role"
  value       = element(concat(aws_iam_role.instance-aws-app-asg.*.arn, [""]), 0)
}

output "aws_iam_role_instance-aws-app-asg_name" {
  description = "Name of instance-aws-app-asg IAM role"
  value       = element(concat(aws_iam_role.instance-aws-app-asg.*.name, [""]), 0)
}

output "aws_iam_instance_profile_instance-aws-app-asg_name" {
  description = "Name of instance-aws-app-asg IAM instance profile"
  value       = element(concat(aws_iam_instance_profile.instance-aws-app-asg.*.name, [""]), 0)
}

output "aws_iam_instance_profile_instance-aws-app-asg_arn" {
  description = "ARN of instance-aws-app-asg IAM instance profile"
  value       = element(concat(aws_iam_instance_profile.instance-aws-app-asg.*.arn, [""]), 0)
}

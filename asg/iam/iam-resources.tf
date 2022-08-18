resource "aws_iam_instance_profile" "instance-aws-app-asg" {
  name = "${var.app_name}-${var.environment}-instance"
  role = aws_iam_role.instance-aws-app-asg.name
}

resource "aws_iam_role" "instance-aws-app-asg" {
  name = "${var.app_name}-${var.environment}-instance"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name = "ec2_ReadOnlyAccess_inline_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["ec2:Describe*"]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }

  inline_policy {
    name = "logs_Access_inline_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "logs:CreateLogStream",
            "logs:DescribeLogStreams",
            "logs:CreateLogGroup",
            "logs:PutLogEvents"
          ]
          Effect   = "Allow"
          Resource = "arn:aws:logs:*:*:*"
        },
      ]
    })
  }

  inline_policy {
    name = "CloudWatch_WriteCustomMetric_Access_inline_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "cloudwatch:PutMetricData"
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }

  # This configuration combines some "default" tags with optionally provided additional tags
  tags = merge(
    local.terraform_tags,
    {
      Name = "${var.app_name}-${var.environment}-instance"
    },
  )

}

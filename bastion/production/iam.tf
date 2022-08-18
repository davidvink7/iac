resource "aws_iam_role" "instance-aws-app" {
  name = "${var.app_name}-${var.aws_region}-instance"
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
}

resource "aws_iam_instance_profile" "instance-aws-app" {
  name = "${var.app_name}-${var.aws_region}-instance"
  role = aws_iam_role.instance-aws-app.name
}

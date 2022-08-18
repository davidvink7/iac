resource "aws_autoscaling_policy" "asg_policy" {
  name                   = "${var.app_name}-${var.environment}-asg-policy"
  autoscaling_group_name = module.autoscaling.autoscaling_group_name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 70.0
  }

}

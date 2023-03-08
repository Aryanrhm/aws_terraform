resource "aws_autoscaling_policy" "autoscaling_policy" {
  name = "asg_policy"
  policy_type = "TargetTrackingScaling"
  adjustment_type        = "ChangeInCapacity"
# The amount of time (seconds) after a scaling completes and the next scaling starts.
  autoscaling_group_name = aws_autoscaling_group.asg.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}
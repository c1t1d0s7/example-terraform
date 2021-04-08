# Scale Up Alarm
resource "aws_autoscaling_policy" "wp-up-policy" {
  name                   = "wp-up-policy"
  autoscaling_group_name = aws_autoscaling_group.wp-asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
}

resource "aws_cloudwatch_metric_alarm" "wp-watch-gt-30" {
  alarm_name          = "wp-watch-gt-30"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.wp-asg.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.wp-up-policy.arn]
}
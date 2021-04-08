resource "aws_lb" "wp-lb" {
  name               = "wp-lb"
  internal           = false
  load_balancer_type = "network"
  subnets = [
    aws_subnet.net-public[0].id,
    aws_subnet.net-public[1].id,
    aws_subnet.net-public[2].id
  ]

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "wp-lb-tg" {
  name     = "wp-lb-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.net.id
}

resource "aws_lb_listener" "wp-lb-front" {
  load_balancer_arn = aws_lb.wp-lb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wp-lb-tg.arn
  }
}
# This resource block defines an AWS Application Load Balancer (ALB).

resource "aws_lb" "ALB" {
  name               = "My-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.SG_id]
  subnets            = var.subnet_id
}


# This resource creates an AWS Application Load Balancer (ALB) target group.
# The health_check block configures the health check settings for the target group:
# - path: The destination for the health check request. It is set to "/".
# - port: The port to use to connect with the target. It is set to 80.
# - protocol: The protocol to use to connect with the target. It is set to "HTTP".

resource "aws_lb_target_group" "ALB" {
  name     = "TargetGroup-ALB"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path     = "/"
    port     = 80
    protocol = "HTTP"
  }
}

# Attaches the first EC2 instance to an existing ALB target group.

resource "aws_lb_target_group_attachment" "TG_Attachment1" {
  target_group_arn = aws_lb_target_group.ALB.arn
  target_id        = var.EC2_instance_1
  port             = 80
}

# Attaches the second EC2 instance to an existing ALB target group.

resource "aws_lb_target_group_attachment" "TG_Attachment2" {
  target_group_arn = aws_lb_target_group.ALB.arn
  target_id        = var.EC2_instance_2
  port             = 80
}

# This resource defines an AWS Application Load Balancer (ALB) listener.
# The listener listens for incoming traffic on port 80 using the HTTP protocol.
# The default action for the listener is to forward the traffic to the specified target group.

resource "aws_lb_listener" "ALB" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ALB.arn
  }
}

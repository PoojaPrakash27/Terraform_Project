# This resource block defines an AWS Application Load Balancer (ALB).

resource "aws_lb" "ALB" {
  name               = "My-LB1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.HTTP_Access.id]
  subnets            = [for subnet in aws_subnet.subnet : subnet.id]
}


# This resource creates an AWS Application Load Balancer (ALB) target group.
# The health_check block configures the health check settings for the target group:
# - path: The destination for the health check request. It is set to "/".
# - port: The port to use to connect with the target. It is set to 80.
# - protocol: The protocol to use to connect with the target. It is set to "HTTP".

resource "aws_lb_target_group" "ALB" {
  name     = "TargetGroup-ALB1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path     = "/"
    port     = 80
    protocol = "HTTP"
  }
}

# Attaches the first EC2 instance to an existing ALB target group.

resource "aws_lb_target_group_attachment" "TG_Attachment1" {
  target_group_arn = aws_lb_target_group.ALB.arn
  target_id        = aws_instance.webserver[keys(var.instances)[0]].id
  port             = 80
}

# Attaches the second EC2 instance to an existing ALB target group.

resource "aws_lb_target_group_attachment" "TG_Attachment2" {
  target_group_arn = aws_lb_target_group.ALB.arn
  target_id        = aws_instance.webserver[keys(var.instances)[1]].id
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

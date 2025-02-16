# This resource creates an AWS Security Group named "SG-SSH" for SSH access.

resource "aws_security_group" "SSH_Access" {
  name   = "SG-SSH"
  vpc_id = aws_vpc.vpc.id
  ingress {
    description = "Allows SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allows all traffic from instance to outside"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# This resource creates an AWS Security Group named "SG-HTTP" for HTTP access.

resource "aws_security_group" "HTTP_Access" {
  name   = "SG-HTTP"
  vpc_id = aws_vpc.vpc.id
  ingress {
    description = "Allows HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allows all traffic from instance to outside"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

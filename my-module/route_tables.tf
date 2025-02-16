# This resource block creates an AWS Internet Gateway (IGW) and attaches it to the specified VPC.

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}

# This resource block creates a Route Table and attaches it to the specified VPC.

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "RT_Internet_Access"
  }
}


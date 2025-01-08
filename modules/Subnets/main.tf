# This resource block defines an AWS subnet.
# - map_public_ip_on_launch: A boolean flag to indicate whether instances launched in this subnet should be assigned a public IP address.

resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet-name
  }
}

# Associates the subnet with a route table.

resource "aws_route_table_association" "Subnet_RT" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = var.route_table_id
}

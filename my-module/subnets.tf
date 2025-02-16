# This resource block defines an AWS subnet.
# - map_public_ip_on_launch: A boolean flag to indicate whether instances launched in this subnet should be assigned a public IP address.

resource "aws_subnet" "subnet" {
  for_each                = var.subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = {
    Name = each.value.name
  }
}

# Associates the subnet with a route table.

resource "aws_route_table_association" "Subnet_RT" {
  for_each       = var.subnets
  subnet_id      = aws_subnet.subnet[each.key].id
  route_table_id = aws_route_table.route_table.id
}

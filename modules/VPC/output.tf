output "VPC-ID" {
  description = "ID of the VPC created"
  value       = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  value       = aws_vpc.vpc.cidr_block
}

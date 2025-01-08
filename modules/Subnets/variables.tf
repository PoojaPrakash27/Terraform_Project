variable "vpc_id" {
  description = "ID of the VPC in which subnet should be created"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "subnet-name" {
  description = "Name of the subnet"
  type        = string
}

variable "route_table_id" {
  description = "ID of the route table"
  type        = string
}

variable "availability_zone" {
  description = "AZ for the subnet"
  type        = string
}

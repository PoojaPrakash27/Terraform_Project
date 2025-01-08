variable "vpc_id" {
  description = "ID of the VPC in which subnet should be created"
  type        = string
}

variable "IGW_name" {
  description = "Name of the Internet Gateway to be created"
  type        = string
}

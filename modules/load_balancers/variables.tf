variable "SG_id" {
  description = "value of security group id"
  type        = string
}

variable "subnet_id" {
  description = "IDs of the subnet whose traffic will be load balanced"
  type        = list(any)
}

variable "vpc_id" {
  description = "value of VPC id"
  type        = string
}

variable "EC2_instance_1" {
  description = "ID of EC2 instance 1"
  type        = string
}

variable "EC2_instance_2" {
  description = "ID of EC2 instance 2"
  type        = string
}

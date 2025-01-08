variable "ami" {
  description = "ami for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "type for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "subnet ID for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair to create"
  type        = string
}

variable "SG-SSH-id" {
  description = "ID of the security group for SSH access"
  type        = string
}

variable "SG-HTTP-id" {
  description = "ID of the security group for HTTP access"
  type        = string
}

variable "app_file" {
  description = "Name of the application file"
  type        = string
}

variable "role_name" {
  description = "Name of the Role"
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket created"
  type        = string
}

variable "EC2_instance_profile" {
  description = "Name of the instance profile"
  type        = string
}

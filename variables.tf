variable "vpc_cidr_block" {
  description = "value of VPC CIDR block"
  type        = string
}

variable "vpc-name" {
  description = "Name of the VPC to be created"
  type        = string
}

variable "IGW_name" {
  description = "Name of the Ineternet Gateway to be created"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair to be created"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket to be created"
  type        = string
}

variable "subnet_cidr_block1" {
  description = "CIDR block of the first subnet"
  type        = string
}

variable "subnet1-name" {
  description = "Name of the first subnet"
  type        = string
}

variable "availability_zone1" {
  description = "Availability zone of the first subnet"
  type        = string
}

variable "ami1" {
  description = "AMI ID of the first EC2 instance"
  type        = string
}

variable "instance1_type" {
  description = "Instance type of the first EC2 instance"
  type        = string
}

variable "instance1_name" {
  description = "Name of the first EC2 instance"
  type        = string
}

variable "app_file_1" {
  description = "Name of the application file for the first EC2 instance"
  type        = string
  default     = "app1.py"
}

variable "subnet_cidr_block2" {
  description = "CIDR block of the second subnet"
  type        = string
}

variable "subnet2-name" {
  description = "Name of the second subnet"
  type        = string
}

variable "availability_zone2" {
  description = "Availability zone of the second subnet"
  type        = string
}

variable "ami2" {
  description = "AMI ID of the second EC2 instance"
  type        = string
}

variable "instance2_type" {
  description = "Instance type of the second EC2 instance"
  type        = string
}

variable "instance2_name" {
  description = "Name of the second EC2 instance"
  type        = string
}

variable "app_file_2" {
  description = "Name of the application file for the second EC2 instance"
  type        = string
  default     = "app2.py"
}


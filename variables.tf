variable "vpc_cidr_block" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "igw_name" {
  type = string
}

variable "key_name" {
  type = string
}

variable "key_path" {
  type = string
}

variable "app1_path" {
  type = string
}

variable "app2_path" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "subnets" {
  type = map(object({
    name = string
    az   = string
    cidr = string
  }))
}

variable "instances" {
  type = map(object({
    instance_name = string
    instance_type = string
    ami           = string
  }))
}

variable "apps" {
  type = list(string)
}

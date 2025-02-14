module "dev-server" {
  source         = "./modules"
  vpc_cidr_block = "10.0.0.0/16"
  vpc-name       = "my-vpc"
  IGW_name       = "my-igw"
  key_name       = "my-key"
  file_path      = "/Path/To/Your/my-key"
  bucket_name    = "my-bucket"
  subnets = {
    subnet-1 = {
      name = "subnet-1"
      az   = "us-west-1a"
      cidr = "10.0.1.0/24"
    }
    subnet-2 = {
      name = "subnet-2"
      az   = "us-west-1b"
      cidr = "10.0.2.0/24"
    }
  }
  instances = {
    instance-1 = {
      instance_name = "EC2_Instance_1"
      instance_type = "t2.micro"
      ami           = "ami-0d144f39b14"
    }
    instance-2 = {
      instance_name = "EC2_Instance_1"
      instance_type = "t2.micro"
      ami           = "ami-03db4db1dc4"
    }
  }
  apps = ["app1.py", "app2.py"]
}

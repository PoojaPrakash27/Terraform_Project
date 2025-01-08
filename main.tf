module "vpc" {
  source         = "./modules/VPC"
  vpc_cidr_block = var.vpc_cidr_block
  vpc-name       = var.vpc-name
}

module "Internet_Connectivity" {
  source   = "./modules/IGW_RouteTables"
  vpc_id   = module.vpc.VPC-ID
  IGW_name = var.IGW_name
}

module "my_key_pair" {
  source   = "./modules/key_pairs"
  key_name = var.key_name
}

module "SG" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.VPC-ID
}

module "my_bucket" {
  source      = "./modules/S3"
  bucket_name = var.bucket_name
}

module "iam_role" {
  source     = "./modules/iam"
  bucket_arn = module.my_bucket.bucket-ARN
}

module "subnet_1" {
  source            = "./modules/Subnets"
  vpc_id            = module.vpc.VPC-ID
  subnet_cidr_block = var.subnet_cidr_block1
  subnet-name       = var.subnet1-name
  availability_zone = var.availability_zone1
  route_table_id    = module.Internet_Connectivity.route_table_id
}

module "EC2_instance_1" {
  source               = "./modules/EC2_instances"
  subnet_id            = module.subnet_1.subnet-ID
  ami                  = var.ami1
  instance_type        = var.instance1_type
  instance_name        = var.instance1_name
  vpc_id               = module.vpc.VPC-ID
  key_name             = module.my_key_pair.key_name
  SG-SSH-id            = module.SG.SG-SSH-id
  SG-HTTP-id           = module.SG.SG-HTTP-id
  app_file             = var.app_file_1
  role_name            = module.iam_role.role_name
  bucket_name          = var.bucket_name
  EC2_instance_profile = module.iam_role.EC2_instance_profile
}

module "subnet_2" {
  source            = "./modules/Subnets"
  vpc_id            = module.vpc.VPC-ID
  subnet_cidr_block = var.subnet_cidr_block2
  subnet-name       = var.subnet2-name
  availability_zone = var.availability_zone2
  route_table_id    = module.Internet_Connectivity.route_table_id
}

module "EC2_instance_2" {
  source               = "./modules/EC2_instances"
  subnet_id            = module.subnet_2.subnet-ID
  ami                  = var.ami2
  instance_type        = var.instance2_type
  instance_name        = var.instance2_name
  vpc_id               = module.vpc.VPC-ID
  key_name             = module.my_key_pair.key_name
  SG-SSH-id            = module.SG.SG-SSH-id
  SG-HTTP-id           = module.SG.SG-HTTP-id
  app_file             = var.app_file_2
  role_name            = module.iam_role.role_name
  bucket_name          = var.bucket_name
  EC2_instance_profile = module.iam_role.EC2_instance_profile
}

module "ALB" {
  source         = "./modules/load_balancers"
  SG_id          = module.SG.SG-HTTP-id
  subnet_id      = [module.subnet_1.subnet-ID, module.subnet_2.subnet-ID]
  EC2_instance_1 = module.EC2_instance_1.instance_ID
  EC2_instance_2 = module.EC2_instance_2.instance_ID
  vpc_id         = module.vpc.VPC-ID

}



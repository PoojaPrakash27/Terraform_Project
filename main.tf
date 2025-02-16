module "dev-env" {
  source         = "./my-module"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = var.vpc_name
  igw_name       = var.igw_name
  key_name       = var.key_name
  key_path       = var.key_path
  app1_path      = var.app1_path
  app2_path      = var.app2_path
  bucket_name    = var.bucket_name
  subnets        = var.subnets
  instances      = var.instances
  apps           = var.apps
}

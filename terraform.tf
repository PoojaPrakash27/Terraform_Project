terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.68.0"
    }
  }
  backend "s3" {
    bucket         = "my-backend-bucket"
    key            = "terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "my-dynamo-db"
  }
}

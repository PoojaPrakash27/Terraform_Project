# AWS Infrastructure Deployment with Terraform

## Project Overview

This Terraform project demonstrates the deployment of a scalable and secure AWS infrastructure. It includes the setup of a VPC, Internet Gateway, Subnets, EC2 instances, Security Groups, S3 bucket, IAM roles, and an Application Load Balancer.

## Architecture

The infrastructure consists of:

- A custom VPC
- Internet Gateway for public internet access
- Two public subnets in different availability zones
- Two EC2 instances, one in each subnet
- Security groups for SSH and HTTP access
- An S3 bucket for storage of the application files to be deployed in the EC2 instances
- IAM role for EC2 instances to access the S3 bucket
- An Application Load Balancer to distribute traffic between the EC2 instances

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v0.12+)
- AWS CLI configured with appropriate credentials

## Project Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│ ├── VPC/
│ ├── IGW_RouteTables/
│ ├── key_pairs/
│ ├── security_groups/
│ ├── S3/
│ ├── iam/
│ ├── Subnets/
│ ├── EC2_instances/
│ └── load_balancers/
└── README.md
```

## Usage

1. Clone this repository
2. Navigate to the project directory
3. Create a terraform.tfvars file in the root directory with the following content:

```
   vpc_cidr_block = <vpc_cidr_block> # for example - "10.0.0.0/16"
   vpc-name = <vpc-name> # for example - "my-vpc"
   IGW_name = <IGW_name> # for example - "my-igw"
   key_name = <key_name> # for example - "my-key-pair"
   bucket_name = <bucket_name> # for example - "my-unique-bucket-name"
   subnet_cidr_block1 = <subnet_cidr_block1> # for example - "10.0.1.0/24"
   subnet1-name = <subnet1-name> # for example - "subnet-1"
   availability_zone1 = <availability_zone1> # for example - "us-west-2a"
   ami1 = <ami1> # for example - "ami-12345678"
   instance1_type = <instance1_type> # for example - "t2.micro"
   instance1_name = <instance1_name> # for example - "instance-1"
   subnet_cidr_block2 = <subnet_cidr_block2> # for example - "10.0.2.0/24"
   subnet2-name = <subnet2-name> # for example - "subnet-2"
   availability_zone2 = <availability_zone2> # for example - "us-west-2b"
   ami2 = <ami2> # for example - "ami-87654321"
   instance2_type = <instance2_type> # for example - "t2.micro"
   instance2_name = <instance2_name> # for example - "instance-2"
```

4. Initialize Terraform:

   ```
   terraform init
   ```

5. Review the planned changes:

   ```
   terraform plan
   ```

6. Apply the configuration:

   ```
   terraform apply
   ```

## Cleanup

To destroy the created resources:

```
terraform destroy
```

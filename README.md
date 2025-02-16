# AWS Infrastructure Deployment with Terraform

## Project Overview

This Terraform project demonstrates the deployment of a secure AWS infrastructure. It includes the setup of a VPC, Internet Gateway, Subnets, EC2 instances, Security Groups, S3 bucket, IAM roles, and an Application Load Balancer. The project has been implemented using modular approach.

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
├── README.md
├── terraform.tf
├── providers.tf
├── main.tf
├── variables.tf
├── modules/
   ├── variables.tf
   ├── outputs.tf
   ├── vpc.tf
   ├── route_table.tf
   ├── key-pairs.tf
   ├── security_groups.tf
   ├── s3.tf
   ├── iam.tf
   ├── subnets.tf
   ├── ec2_instances.tf
   └── load_balancer.tf

```

## Usage

1. Clone this repository
2. Navigate to the project directory
3. Create a terraform.tfvars file in the root directory with the following contents:

```
   vpc_cidr_block = "10.1.0.0/16"
   vpc_name       = "my-vpc"
   igw_name       = "my-igw"
   key_name       = "my-key"
   key_path       = "Path/To/Key/my-key"
   app1_path      = "Path/To/App/app1.py"
   app2_path      = "Path/To/App/app2.py"
   bucket_name    = "my-bucket"
   subnets = {
      subnet-1 = {
         name = "subnet-1"
         az   = "us-west-1a"
         cidr = "10.1.1.0/24"
      }
      subnet-2 = {
         name = "subnet-2"
         az   = "us-west-1b"
         cidr = "10.1.2.0/24"
      }
   }
   instances = {
      instance-1 = {
         instance_name = "EC2_Instance_1"
         instance_type = "t2.micro"
         ami           = "ami-07d2649d67dbe8900"
      }
      instance-2 = {
         instance_name = "EC2_Instance_2"
         instance_type = "t2.micro"
         ami           = "ami-07d2649d67dbe8900"
      }
   }
   apps = ["app1.py", "app2.py"]

```

Note that the values provided above are sample values. Please adapt the terraform.tfvars file as per requirement.

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

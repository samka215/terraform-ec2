
provider "aws" {
  region = local.aws_region
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# terraform {
#   backend "s3" {
#     bucket         = "your-bucket-name"
#     dynamodb_table = "your-dynamodb-table"
#     key            = "your-key"
#     region         = "us-east-1"
#   }
# }

locals {
  aws_region                    = "us-east-1"
  ec2_instance_ami              = "ami-0ddc798b3f1a5117e"
  ec2_instance_type             = "t2.micro"
  security_groups               = ["sg-0fd30a6787b68a568"]
  vpc_id                        = "vpc-0e76b2c583b4ccd94"
  subnet_id                     = "subnet-0fa1220c77e6b2714"
  root_volume_size              = 10
  instance_count                = 1
  enable_termination_protection = false
  ec2_instance_key_name         = "s7-key"

  tags = {
    Name       = "samka"
    Env        = "dev"
    Project    = "anaconda"
    Created_by = "samka"
    Team       = "devops"
  }

}

module "ec2_instance" {
  source           = "../../modules/ec2_instance"
  count            = local.instance_count
  ami_id           = local.ec2_instance_ami
  instance_type    = local.ec2_instance_type
  security_groups  = local.security_groups
  key_name         = local.ec2_instance_key_name
  subnet_id        = local.subnet_id
  root_volume_size = local.root_volume_size
  tags = merge(local.tags, {
    Name = format("%s-%s-%s", local.tags["Env"], local.tags["Team"], local.tags["Project"])
    }
  )

}


output "instance_ids" {
  value       = [for instance in module.ec2_instance : instance.instance_id]
  description = "The IDs of the EC2 instances"
}

output "public_ips" {
  value       = [for instance in module.ec2_instance : instance.public_ip]
  description = "The public IP addresses of the EC2 instances"
}

output "private_ips" {
  value       = [for instance in module.ec2_instance : instance.private_ip]
  description = "The private IP addresses of the EC2 instances"
}

output "availability_zones" {
  value       = [for instance in module.ec2_instance : instance.availability_zone]
  description = "The availability zones of the EC2 instances"
}



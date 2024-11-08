terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0.0"
    }
  }
  required_version = ">1"
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "samka" {
  ami                         = "ami-0ddc798b3f1a5117e"
  instance_type               = "t2.micro"
  key_name                    = "s7-key"
  subnet_id                   = "subnet-0fa1220c77e6b2714"
  associate_public_ip_address = true
  security_groups             = ["sg-0fd30a6787b68a568"]

  tags = {
    Name      = "samka-ec2"
    Env       = "dev"
    Project   = "anaconda"
    Create_By = "samka"
    Team      = "devops"
  }
}

output "instance_public_ip" {
  value = aws_instance.samka.public_ip
}

output "instance_private_ip" {
  value = aws_instance.samka.private_ip
}

output "instance_id" {
  value = aws_instance.samka.id
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  alias  = "region1"
  region = var.aws_region_main
}

provider "aws" {
  alias  = "region2"
  region = var.aws_region_backup
}

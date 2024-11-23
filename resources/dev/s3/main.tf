terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


locals {
  tags = {
    "owner"       = "Samuel"
    "teams"       = "devops"
    "environment" = "dev"
    "project"     = "anaconda"
    "create_by"   = "Samuel"
  }
}

module "s3_region1" {
  source = "../../../modules/s3"
  tags   = local.tags

}


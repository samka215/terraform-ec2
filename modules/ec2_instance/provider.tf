terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>4.0.0"
    }
  }
  #required_version = "value"
}

provider "aws" {
  region =  "us-east-1"
}
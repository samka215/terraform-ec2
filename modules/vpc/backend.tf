terraform {
  backend "s3" {
    bucket         = "devops-dev-anaconda-source"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "devops-dev-anaconda-dynano"
  }
}

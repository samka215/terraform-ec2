provider "aws" {
  alias  = "region1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "region2"
  region = "us-east-2"
}


# module "iam_role" {
#   source             = "./modules/iam-role"
#   primary_bucket_arn = module.s3_bucket.primary_bucket_arn
#   replica_bucket_arn = module.s3_bucket.replica_bucket_arn
# }

module "s3_bucket" {
  source = "./modules/s3-bucket"
  # bucket_name          = var.bucket_name
  # replica_bucket_name  = var.replica_bucket_name
  # replica_region       = var.replica_region
  # replication_role_arn = module.iam_role.replication_role_arn
}

# module "dynamodb" {
#   source     = "./modules/dynamodb"
#   table_name = var.table_name
# }

# terraform {
#   backend "s3" {
#     bucket         = module.s3_bucket.source_name
#     key            = "terraform/state/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = module.dynamodb.lock_table_name
#     encrypt        = true
#   }
# }

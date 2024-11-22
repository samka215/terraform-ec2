variable "bucket_name" {
  description = "Name of the primary S3 bucket for Terraform state."
  default     = "my-terraform-state-bucket"
}

variable "replica_bucket_name" {
  description = "Name of the replica S3 bucket for cross-region replication."
  default     = "my-terraform-replica-bucket"
}

variable "table_name" {
  description = "Name of the DynamoDB table used for Terraform state locking."
  default     = "terraform-lock"
}

variable "replica_region" {
  description = "Region for the replica S3 bucket."
  default     = "us-east-1"
}

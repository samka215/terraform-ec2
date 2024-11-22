# output "primary_bucket_name" {
#   value       = module.s3_bucket.primary_bucket_name
#   description = "Name of the primary S3 bucket for Terraform state."
# }

# output "replica_bucket_name" {
#   value       = module.s3_bucket.replica_bucket_name
#   description = "Name of the replica S3 bucket for Terraform state."
# }

# output "lock_table_name" {
#   value       = module.dynamodb.lock_table_name
#   description = "Name of the DynamoDB table for state locking."
# }

# output "replication_role_arn" {
#   value       = module.iam_role.replication_role_arn
#   description = "ARN of the IAM role for S3 replication."
# }

# output "lock_table_name" {
#   description = "Name of the DynamoDB table for state locking."
#   value       = aws_dynamodb_table.lock_table.name
# }
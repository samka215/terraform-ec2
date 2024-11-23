output "primary_bucket_name" {
  description = "Name of the primary S3 bucket."
  value       = aws_s3_bucket.source.bucket
}

output "replica_bucket_name" {
  description = "Name of the replica S3 bucket."
  value       = aws_s3_bucket.destination.bucket
}

output "primary_bucket_arn" {
  description = "ARN of the primary S3 bucket."
  value       = aws_s3_bucket.source.arn
}

output "replica_bucket_arn" {
  description = "ARN of the replica S3 bucket."
  value       = aws_s3_bucket.destination.arn
}

output "lock_table_name" {
  description = "Name of the DynamoDB table for state locking."
  value       = aws_dynamodb_table.lock_table.name
}

output "primary_bucket_name" {
  value = aws_s3_bucket.source.bucket
}

output "replica_bucket_name" {
  value = aws_s3_bucket.destination.bucket
}

output "primary_bucket_arn" {
  value = aws_s3_bucket.source.arn
}

output "replica_bucket_arn" {
  value = aws_s3_bucket.destination.arn
}

output "lock_table_name" {
  value = aws_dynamodb_table.lock_table.name
}

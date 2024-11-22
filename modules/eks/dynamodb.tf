resource "aws_dynamodb_table" "lock_table" {
  name           = format("%s-%s-%s-dynano", var.tags["teams"], var.tags["environment"], var.tags["project"])
  # billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.tags
}

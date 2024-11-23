provider "aws" {
  alias  = "region1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "region2"
  region = "us-east-2"
}


resource "aws_s3_bucket" "destination" {
  provider = aws.region2
  bucket   = format("%s-%s-%s-destination", var.tags["teams"], var.tags["environment"], var.tags["project"])
  tags     = var.tags
}

resource "aws_s3_bucket_versioning" "destination" {
  provider = aws.region2
  bucket   = aws_s3_bucket.destination.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "source" {
  provider = aws.region1
  bucket   = format("%s-%s-%s-source", var.tags["teams"], var.tags["environment"], var.tags["project"])
  tags     = var.tags

}

# resource "aws_s3_bucket_acl" "source_bucket_acl" {
#   provider = aws.region1
#   bucket = aws_s3_bucket.source.id
#   acl    = "private"

# }




resource "aws_s3_bucket_versioning" "source" {
  provider = aws.region1
  bucket   = aws_s3_bucket.source.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_replication_configuration" "replication" {
  provider = aws.region1
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.source]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.source.id

  rule {
    id = "freplicate-objects"

    # filter {
    #   prefix = "foo"
    # }

    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.destination.arn
      storage_class = "STANDARD"
    }
  }
}
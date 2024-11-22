# Create VPC resources
resource "aws_vpc" "anaconda" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-vpc", var.tags["teams"], var.tags["environment"], var.tags["project"])
    },
  )
}

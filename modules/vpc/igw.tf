resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.anaconda.id

  tags = merge(var.tags, {
    Name = format("%s-%s-%s-igw", var.tags["teams"], var.tags["environment"], var.tags["project"])
    },
  )
}



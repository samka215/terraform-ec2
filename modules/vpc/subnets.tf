# # Create subnets
# resource "aws_subnet" "public1" {
#   cidr_block              = "${var.subnet_cidr_prefix}0.0/24"
#   vpc_id                  = aws_vpc.anaconda.id
#   availability_zone       = var.availability_zones[0]
#   map_public_ip_on_launch = true
#   tags = merge(var.tags, {
#     Name = format("%s-%s-%s-Public-sub1", var.tags["teams"], var.tags["environment"], var.tags["project"])
#     },
#   )
#   # depends_on = [
#   #   aws_route_table_association.public1,
#   # ]
# }

# resource "aws_subnet" "public2" {
#   cidr_block              = "${var.subnet_cidr_prefix}1.0/24"
#   vpc_id                  = aws_vpc.anaconda.id
#   availability_zone       = var.availability_zones[1]
#   map_public_ip_on_launch = true
#   tags = merge(var.tags, {
#     Name = format("%s-%s-%s-Public-sub2", var.tags["teams"], var.tags["environment"], var.tags["project"])
#     },
#   )
#   # depends_on = [
#   #   aws_route_table_association.public2,
#   # ]
# }

# resource "aws_subnet" "private1" {
#   cidr_block        = "${var.subnet_cidr_prefix}2.0/24"
#   vpc_id            = aws_vpc.anaconda.id
#   availability_zone = var.availability_zones[0]
#   tags = merge(var.tags, {
#     Name = format("%s-%s-%s-Private-sub1", var.tags["teams"], var.tags["environment"], var.tags["project"])
#     },
#   )
#   # depends_on = [
#   #   aws_route_table_association.private1,
#   # ]
# }

# resource "aws_subnet" "private2" {
#   cidr_block        = "${var.subnet_cidr_prefix}3.0/24"
#   vpc_id            = aws_vpc.anaconda.id
#   availability_zone = var.availability_zones[1]
#   tags = merge(var.tags, {
#     Name = format("%s-%s-%s-Private-sub2", var.tags["teams"], var.tags["environment"], var.tags["project"])
#     },
#   )
#   # depends_on = [
#   #   aws_route_table_association.private2,
#   # ]
# }


resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.anaconda.id
  cidr_block              = "${var.subnet_cidr_prefix}.1.0/24"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name = format("%s-%s-%s-Public-Subnet1", var.tags["teams"], var.tags["environment"], var.tags["project"])
    },
  )
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.anaconda.id
  cidr_block              = "${var.subnet_cidr_prefix}.2.0/24"
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name = format("%s-%s-%s-Public-Subnet2", var.tags["teams"], var.tags["environment"], var.tags["project"])
    },
  )
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.anaconda.id
  cidr_block        = "${var.subnet_cidr_prefix}.3.0/24"
  availability_zone = var.availability_zones[0]
  tags = merge(
    var.tags,
    {
      Name = format("%s-%s-%s-Private-Subnet1", var.tags["teams"], var.tags["environment"], var.tags["project"])
    },
  )
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.anaconda.id
  cidr_block        = "${var.subnet_cidr_prefix}.4.0/24"
  availability_zone = var.availability_zones[1]
  tags = merge(
    var.tags,
    {
      Name = format("%s-%s-%s-Private-Subnet2", var.tags["teams"], var.tags["environment"], var.tags["project"])
    },
  )
}

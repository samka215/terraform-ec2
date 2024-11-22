# # Create route tables
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.anaconda.id
#   tags = merge(var.tags, {
#     Name = format("%s-%s-%s-Public-RT", var.tags["teams"], var.tags["environment"], var.tags["project"])
#     },
#   )
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
# }

# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.anaconda.id
#   tags = merge(var.tags, {
#     Name = format("%s-%s-%s-Private-RT", var.tags["teams"], var.tags["environment"], var.tags["project"])
#     },
#   )
# }

# # Create route table associations
# resource "aws_route_table_association" "public1" {
#   subnet_id      = aws_subnet.public1.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "public2" {
#   subnet_id      = aws_subnet.public2.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "private1" {
#   subnet_id      = aws_subnet.private1.id
#   route_table_id = aws_route_table.private.id
# }

# resource "aws_route_table_association" "private2" {
#   subnet_id      = aws_subnet.private2.id
#   route_table_id = aws_route_table.private.id
# }

# Create route tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.anaconda.id
  tags = merge(
    var.tags,
    {
      Name = format("%s-%s-%s-Public-RT", var.tags["teams"], var.tags["environment"], var.tags["project"])
    },
  )
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.anaconda.id
  tags = merge(
    var.tags,
    {
      Name = format("%s-%s-%s-Private-RT", var.tags["teams"], var.tags["environment"], var.tags["project"])
    },
  )
}

resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0" # For all outbound traffic
  nat_gateway_id         = aws_nat_gateway.NAT-GW.id

  depends_on = [aws_nat_gateway.NAT-GW]
}

# Create route table associations
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}
# Create NAT Gateway in Public Subnet
resource "aws_nat_gateway" "NAT-GW" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public1.id
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-Nat-GW", var.tags["teams"], var.tags["environment"], var.tags["project"])
    },
  )
  depends_on = [aws_internet_gateway.igw]
}


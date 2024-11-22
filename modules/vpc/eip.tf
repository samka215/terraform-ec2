# Create EIP  for ny NAT GateWay
resource "aws_eip" "nat" {
  vpc = true
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-Private-sub2", var.tags["teams"], var.tags["environment"], var.tags["project"])
    },
  )
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id
  tags = {
    Name = "nat-gateway"
  }
}

resource "aws_eip" "nat" {
  vpc = true
}
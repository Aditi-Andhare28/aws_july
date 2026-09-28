resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "Day05-NAT-EIP"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "Day05-NAT-Gateway"
  }
}
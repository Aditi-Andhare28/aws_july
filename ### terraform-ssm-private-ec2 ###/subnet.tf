resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  ####### due to below line code private ec2 doesnt get public ip
  map_public_ip_on_launch = false

  tags = {
    Name = "ssm-private-subnet"
  }
}

######## creating subnet route table and thier association  ##########

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "ssm-private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
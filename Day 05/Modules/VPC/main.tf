resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostname

  tags = {
    Name = var.vpc_name
  }
}
#Creating subnets

resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnet_1_cidr

  tags = {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnet_2_cidr

  tags = {
    Name = "Public-Subnet-2"
  }
}

resource "aws_subnet" "public_3" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnet_3_cidr

  tags = {
    Name = "Public-Subnet-3"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_1_cidr

  tags = {
    Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_2_cidr

  tags = {
    Name = "Private-Subnet-2"
  }
}

resource "aws_subnet" "private_3" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_3_cidr

  tags = {
    Name = "Private-Subnet-3"
  }
}

#### internet gateway creation and attach to vpc ####

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "Day05-IGW"
  }
}

#### adding route to igw

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "Public-Route-Table"
  }
}
####### route table association to public subnet ########

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "public_3" {
  subnet_id      = aws_subnet.public_3.id
  route_table_id = aws_route_table.public.id
}
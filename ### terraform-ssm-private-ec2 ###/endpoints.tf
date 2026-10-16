########### we required 3 endpoints for securely communication between ec2 resource and aws SSM service
########3 namely ssm, ssmmessages, ec2messages

###### security group for endpoints

resource "aws_security_group" "vpc_endpoint" {
  name        = "ssm-vpc-endpoint-sg"
  description = "Security group for SSM VPC endpoints"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "HTTPS from private EC2"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssm-vpc-endpoint-sg"
  }
}


######### ssm endpoints

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.ap-south-1.ssm"
  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.private.id
  ]

  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "ssm-endpoint"
  }
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.ap-south-1.ssmmessages"
  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.private.id
  ]

  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "ssmmessages-endpoint"
  }
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.ap-south-1.ec2messages"
  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.private.id
  ]

  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "ec2messages-endpoint"
  }
}
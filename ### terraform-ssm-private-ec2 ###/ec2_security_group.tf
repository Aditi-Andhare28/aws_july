resource "aws_security_group" "ec2" {
  name        = "ssm-private-ec2-sg"
  description = "Security group for private SSM EC2"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssm-private-ec2-sg"
  }
}

########### in above code no inbound rules are created like ssh and https, http ########
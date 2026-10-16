resource "aws_instance" "private" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"

  subnet_id = aws_subnet.private.id

  vpc_security_group_ids = [
    aws_security_group.ec2.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ssm.name

  associate_public_ip_address = false

  tags = {
    Name = "private-ssm-ec2"
  }
}
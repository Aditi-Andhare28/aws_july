resource "aws_security_group" "app" {
  name        = "${var.name}-sg"
  description = "Security group for application servers"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-sg"
  }
}


resource "aws_instance" "app" {
  count = 3

  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"

  subnet_id = var.private_subnet_ids[count.index]

  vpc_security_group_ids = [
    aws_security_group.app.id
  ]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "Hello from ${var.name} - Server ${count.index + 1}" > /var/www/html/index.html
              EOF

  tags = {
    Name = "${var.name}-server-${count.index + 1}"
  }
}
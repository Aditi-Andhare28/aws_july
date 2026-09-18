terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "my_ec2" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"
  subnet_id     = "subnet-03d61b0385f36f04e"

  tags = {
    Name = "Terraform-EC2"
  }
}
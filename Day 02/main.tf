resource "aws_instance" "my_ec2" {
  ami           = var.instance_ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  count =         var.instance_count

  tags = {
    Name = "Terraform-EC2"
  }
}
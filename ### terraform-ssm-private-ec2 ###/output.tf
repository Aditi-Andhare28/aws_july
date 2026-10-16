############### for getting output of vpc-id, subnet-id, ec2-private-ip, ec2-id in terminal 

output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "ec2_id" {
  value = aws_instance.private.id
}

output "ec2_private_ip" {
  value = aws_instance.private.private_ip
}
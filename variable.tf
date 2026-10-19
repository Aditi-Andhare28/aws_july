variable "ami_id" {
  type        = string
  description = "Ubuntu AMI id"
}

variable "instance_type" {
  type        = string
  description = "ec2 instance type"
  default     = "t3.micro"
}
variable "vpc_id" {
  type        = string
  description = "exsisting vpc used day-05"
}
variable "subnet_id" {
  type        = string
  description = "day-05-public-subnet"
}

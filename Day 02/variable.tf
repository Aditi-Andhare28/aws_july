variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"

}
variable "instance_ami_id" {
  type        = string
  default     = "ami-01a00762f46d584a1"
  description = "EC2 instance ami id"
}
variable "subnet_id" {
  type        = string
  default     = "subnet-03d61b0385f36f04e"
  description = "EC2 instance subnet id"

}
variable "instance_count"{
    description = "this is for number of Ec2 instances."
    type = number
    default = 4
}
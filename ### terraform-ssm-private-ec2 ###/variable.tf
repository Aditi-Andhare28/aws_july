variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "private_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
variable "availability_zone" {
  default = "ap-south-1a"
}
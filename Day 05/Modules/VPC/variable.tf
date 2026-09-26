variable "vpc_cidr" {
  type = string

}
variable "vpc_name" {
  type = string

}
variable "enable_dns_support" {
  type = bool

}
variable "enable_dns_hostname" {
  type = bool

}

#### Variables for subnet #####

variable "public_subnet_1_cidr" {
  type = string

}
variable "public_subnet_2_cidr" {
  type = string
}
variable "public_subnet_3_cidr" {
  type = string

}
variable "private_subnet_1_cidr" {
  type = string

}
variable "private_subnet_2_cidr" {
  type = string

}
variable "private_subnet_3_cidr" {
  type = string

}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"

}

variable "vpc_name" {
  type    = string
  default = "Day-05-VPC"

}

variable "enable_dns_support" {
  type    = bool
  default = true

}

variable "enable_dns_hostname" {
  type    = bool
  default = true

}

variable "public_subnet_1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "public_subnet_3_cidr" {
  type    = string
  default = "10.0.3.0/24"
}

variable "private_subnet_1_cidr" {
  type    = string
  default = "10.0.4.0/24"
}

variable "private_subnet_2_cidr" {
  type    = string
  default = "10.0.5.0/24"
}

variable "private_subnet_3_cidr" {
  type    = string
  default = "10.0.6.0/24"
}
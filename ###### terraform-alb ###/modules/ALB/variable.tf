variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "name" {
  type = string
}

variable "target_instance_ids" {
  type = list(string)
}
variable "domain_name" {
  type = string
}
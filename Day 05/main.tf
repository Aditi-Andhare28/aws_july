module "vpc" {
  source = "./Modules/VPC"

  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  enable_dns_support  = var.enable_dns_support
  enable_dns_hostname = var.enable_dns_hostname

  # subnet cidr 
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  public_subnet_3_cidr = var.public_subnet_3_cidr

  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  private_subnet_3_cidr = var.private_subnet_3_cidr

}

##### for creating another vpc use existing module call and just change their 
#name,cidr,and all thngs and run terraform commands thats it ! #######

# module "dev_vpc" {
#   source = "./Modules/VPC"

#   vpc_cidr = "172.16.0.0/16"
#   vpc_name = "Dev_VPC"

# }
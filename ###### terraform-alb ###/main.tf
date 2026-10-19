module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "Mesha-ALB-VPC"
}

########## ec2 calling module

module "ec2" {
  source = "./modules/ec2"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  name               = "Mesha"
}

########### calling alb module

module "alb" {
  source = "./modules/alb"

  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  target_instance_ids = module.ec2.instance_ids
  name                = "Mesha"
  domain_name         = var.domain_name
}
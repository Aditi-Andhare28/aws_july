terraform {
  backend "s3" {
    bucket = "s3-terraform-backend-078038151876-ap-south-1-an"
    key    = "compute/fctp/dev/Day03/terraform.tfstate"
    region = "ap-south-1"
  }
}
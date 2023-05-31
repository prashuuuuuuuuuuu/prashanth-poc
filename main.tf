terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "~> 4.0"
}
}
}
provider "aws" {
  region = "ap-northeast-1"  # Replace with your desired region
}

module "prashanth1"{
  source=

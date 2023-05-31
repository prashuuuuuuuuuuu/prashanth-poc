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
  source= ".//module-1"
}
  
  
  module "prashanth2"{
  source= ".//module-2"
}
    
    module "prashanth3"{
  source= ".//module-3"
}

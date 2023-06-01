provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.subnet_availability_zone
}

resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_security_group" "security_group1" {
  name        = "allow-all-traffic"
  description = "Security group allowing all traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}





output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.vpc1.id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = aws_subnet.subnet1.id
}

output "security_group_id"
  description = "ID of the security_group_id"
  default =  aws_security_group.security_group1.id"


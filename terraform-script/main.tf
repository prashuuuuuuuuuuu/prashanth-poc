terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "~> 4.0"
}
}
}

# Configure the AWS Provider
provider "aws" {
region = "ap-northeast-1"
}

# Create a VPC
resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr_block
}

# Create a subnet within the VPC
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.subnet_availability_zone
}

# Create an internet gateway
resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
}

# Create a route table and associate it with the subnet
resource "aws_route_table" "routetable1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "my_route_table_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.routetable1.id
}

# Create a security group allowing all traffic
resource "aws_security_group" "security_group1" {
  name        = "security_group1"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.vpc1.id

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

# Create individual instances
resource "aws_instance" "master" {
  ami                    = var.ami_id
  instance_type          = "t2.medium"
  key_name               = "tokyo"
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.security_group1.id]
  tags = {
    Name = "master"
  }
}

resource "aws_instance" "worker-1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "tokyo"
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.security_group1.id]
  tags = {
    Name = "worker-1"
  }
}

resource "aws_instance" "worker-2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "tokyo"
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.security_group1.id]
  tags = {
    Name = "worker-2"
  }
}

# Create VPC peering connection
resource "aws_vpc_peering_connection" "my_peering_connection" {
  vpc_id                 = aws_vpc.vpc1.id
  peer_vpc_id            = "vpc-06fa15513cc3b550b"
  auto_accept            = true
#  allow_remote_vpc_dns_resolution = true
  tags = {
    Name = "VPC Peering Connection"
  }
}

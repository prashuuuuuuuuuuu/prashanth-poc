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

# Create VPC
resource "aws_vpc" "vpc1" {
  cidr_block = "20.0.0.0/16"
}

# Create Subnet
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "20.0.0.0/24"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
}
resource "aws_route_table" "routetable1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }
}

resource "aws_route_table_association" "my_route_table_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.routetable1.id
}

# Create Security Group allowing all traffic
resource "aws_security_group" "securitygroup1" {
  name        = "my_security_group"
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

# Create Instances
resource "aws_instance" "master" {
  ami           = "ami-0ed99df77a82560e6"  # Replace with your desired AMI ID
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.securitygroup1.id]
  tags = {
    Name = "master"
}
}

resource "aws_instance" "worker-1" {
  ami           = "ami-0ed99df77a82560e6"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.securitygroup1.id]
  tags = {
    Name = "worker-1"
}
}
resource "aws_instance" "worker-2" {
  ami           =  "ami-0ed99df77a82560e6"# Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.securitygroup1.id]
  tags = {
    Name = "worker-2"
}
}


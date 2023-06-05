provider "aws" {
  region = var.region
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

# Create a subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.subnet_availability_zone
}

# Create an internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create a route table and associate it with the subnet
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "my_route_table_association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}

# Create a security group allowing all traffic
resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.my_vpc.id

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
resource "aws_instance" "instance1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  tags = {
    Name = "Instance1"
  }
}

resource "aws_instance" "instance2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  tags = {
    Name = "Instance2"
  }
}

resource "aws_instance" "instance3" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  tags = {
    Name = "Instance3"
  }
}

# Create VPC peering connection
resource "aws_vpc_peering_connection" "my_peering_connection" {
  vpc_id                 = aws_vpc.my_vpc.id
  peer_vpc_id            = var.peer_vpc_id
  auto_accept            = true
  allow_remote_vpc_dns_resolution = true
  tags = {
    Name = "VPC Peering Connection"
  }
}

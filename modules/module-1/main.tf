resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
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

output "vpc_id" {
  value = aws_vpc.vpc1.id
}

output "subnet_id" {
  value = aws_subnet.subnet1.id
}

output "route_table_id" {
  value = aws_route_table.routetable1.id
}

output "igw_id" {
  value = aws_internet_gateway.igw1.id
}

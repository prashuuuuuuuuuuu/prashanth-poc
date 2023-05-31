output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.vpc1.id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = aws_subnet.subnet1.id
}

output "route_table_id" {
  description = "ID of the created route table"
  value       = aws_route_table.routetable1.id
}

output "igw_id" {
  description = "ID of the created internet gateway"
  value       = aws_internet_gateway.igw1.id
}

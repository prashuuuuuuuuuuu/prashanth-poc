output "instance1_id" {
  value = "aws_instance.instance1.id"
}

output "instance2_id" {
  value = "aws_instance.instance2.id"
}

output "instance3_id" {
  value = "aws_instance.instance3.id"
}

output "subnet_id" {
  value = "aws_subnet.subnet1.id"
  
  output "vpc_id" {
    value = "aws_vpc.vpc1.id"

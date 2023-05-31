variable "ami" {
  description = "ami-0ed99df77a82560e6"
}

variable "instance_type" {
  description = "t2.medium"
}

variable "subnet_id" {
  description = "aws_subnet.subnet1.id"
}

variable "security_group_id" {
  description = "aws_security_group.allow"
}

variable "ami" {
  description = "ami"
  value = ami-0ed99df77a82560e6
}
#
variable "instance_type" {
  description = "instance_type"
  value = t2.medium
}

variable "subnet_id" {
  description = "aws_subnet_id"
  
}

variable "security_group_id" {
  description = "aws_security_group_id"
  
}

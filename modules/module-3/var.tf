variable "ami" {
  description = "ami"
  value = ami-0ed99df77a82560e6
}

variable "instance_type" {
  description = "instance_type"
  value = t2.medium
}

variable "subnet_id" {
  description = "aws_subnet_id"
  default = module.module-3.aws_subnet
}

variable "security_group_id" {
  description = "aws_security_group_id"
  value = module.module-3.aws_security_group
}

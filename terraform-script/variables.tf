#variable "region" {
#  description = "AWS region"
#  default     = "ap-northeast-1"
#}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "30.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  default     = "30.0.1.0/24"
}

variable "subnet_availability_zone" {
  description = "Availability zone for the subnet"
  default     = "ap-northeast-1a"
}

variable "ami_id" {
  description = "AMI ID for the instances"
  default     = "ami-0ed99df77a82560e6"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

variable "peer_vpc_id" {
  description = "vpc-06fa15513cc3b550b"
  value = "vpc-06fa15513cc3b550b"
}

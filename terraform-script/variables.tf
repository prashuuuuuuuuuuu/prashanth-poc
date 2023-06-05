variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "subnet_availability_zone" {
  description = "Availability zone for the subnet"
  default     = "us-west-2a"
}

variable "ami_id" {
  description = "AMI ID for the instances"
  default     = "ami-12345678"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

variable "peer_vpc_id" {
  description = "ID of the peer VPC for VPC peering"
}

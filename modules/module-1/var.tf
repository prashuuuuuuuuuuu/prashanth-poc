variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "20.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "20.0.0.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "ap-northeast-1a"
}

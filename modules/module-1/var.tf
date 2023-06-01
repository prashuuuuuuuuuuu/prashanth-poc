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

variable "subnet_availability_zone" {
  description = "Availability Zone for the subnet"
  type        = string
  default     = "ap-northeast-2"
}


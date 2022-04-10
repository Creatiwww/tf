variable "vpc_id" {
  description = "Subnet's VPC"
  type        = string
}

variable "availability_zone" {
  description = "Network AZ"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block of VPC"
  type        = string
}

variable "tag_name" {
  description = "name of the subnet"
  type        = string
}

variable "ami" {
  description = "AMI"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  type        = string
}

variable "subnet_id" {
  description = "subnet id"
  type        = string
}

variable "tag_name" {
  description = "instance name"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the route table will be created."
  type        = string
}

variable "ig_id" {
  description = "The Internet Gateway ID to attach to the route."
  type        = string
}

variable "subnet_id" {
  description = "The Subnet ID to associate with the route table."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to associate with the subnet."
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "The availability zone to create the subnet in."
  type        = string
  default     = "us-west-2a"
}

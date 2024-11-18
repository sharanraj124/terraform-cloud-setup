variable "ami" {
  description = "The AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be launched."
  type        = string
}

variable "security_groups" {
  description = "The security groups to associate with the EC2 instance."
  type        = list(string)
}

variable "key_name" {
  description = "The name of the SSH key pair to use for the EC2 instance."
  type        = string
}
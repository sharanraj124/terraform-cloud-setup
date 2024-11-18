output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2.instance_id  # Reference the EC2 module output
}

output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2.instance_public_ip  # Reference the EC2 module output
}

resource "aws_instance" "my_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
  key_name        = var.key_name

  tags = {
    Name = "My-EC2-Instance"
  }

  associate_public_ip_address = true
}


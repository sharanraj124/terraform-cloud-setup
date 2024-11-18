module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "subnet" {
  source          = "./modules/subnet"
  vpc_id          = module.vpc.id
  cidr_block      = "10.0.1.0/24"
  availability_zone = "us-west-2a"
}

module "internet_gateway" {
  source  = "./modules/internet_gateway"
  vpc_id  = module.vpc.id
}

module "security_group" {
  source  = "./modules/security_group"
  vpc_id  = module.vpc.id
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-046b5b8111c19b3ac"
  instance_type = "t2.micro"
  subnet_id     = module.subnet.id
  security_groups = [module.security_group.id]
  key_name      = "my-key-pair"
}

module "route_table" {
  source     = "./modules/route_table"
  vpc_id     = module.vpc.id
  ig_id      = module.internet_gateway.id
  subnet_id  = module.subnet.id
}

module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = "my-ec2-terraform-state-bucket"
}

module "dynamodb" {
  source = "./modules/dynamodb"
  name   = "terraform-locks"
}

module "key_pair" {
  source     = "./modules/key_pair"
  key_name   = "my-key-pair"               # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa_digi.pub")  # Path to your SSH public key
}






















terraform {
  backend "s3" {
    bucket         = "my-ec2-terraform-state-bucket"  # Replace with your S3 bucket name
    key            = "terraform.tfstate"  # Path within the bucket for state storage
    region         = "us-west-2"  # AWS region of the S3 bucket
    encrypt        = true  # Enable server-side encryption
    dynamodb_table  = "terraform-locks"  # DynamoDB table for state locking
    acl            = "bucket-owner-full-control"  # Optional: Specify ACL permissions
  }
}

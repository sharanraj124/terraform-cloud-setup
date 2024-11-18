resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket_ownership" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_ownership]

  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}

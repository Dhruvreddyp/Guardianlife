resource "aws_s3_bucket" "terraform_state" {
  bucket = "tf-states-guardian-life"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.terraform_state.bucket

}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"

}

terraform {
  backend "s3" {
    bucket         = "tf-states-guardian-life"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}

terraform {
  required_version = ">= 1.10.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# -----------------------------------
# S3 Bucket for Terraform State
# -----------------------------------

resource "aws_s3_bucket" "terraform_state" {
  bucket = "multi-stack-devops-state-686699774218"

  tags = {
    Name    = "multi-stack-devops-state"
    Project = "Multi-Stack-DevOps"
  }
}

# Enable Bucket Versioning
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block Public Access
resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# -----------------------------------
# DynamoDB for Terraform State Locking
# -----------------------------------

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "multi-stack-devops-terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name    = "multi-stack-devops-terraform-lock"
    Project = "Multi-Stack-DevOps"
  }
}
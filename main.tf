terraform {
  required_version = ">= 1.16.0"

  backend "s3" {
    bucket       = "terraform-0087"
    region     = "us-east-1"
    key          = "aws/state/terraform.tfstate"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "aws_region" {
  description = "AWS region in which to create the bucket."
  type        = string
  default     = "us-east-1"
}

variable "bucket_names" {
  description = "Globally unique names for the S3 buckets."
  type        = list(string)
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "this" {
  for_each = toset(var.bucket_names)

  bucket = each.value
}

resource "aws_s3_bucket_public_access_block" "this" {
  for_each = aws_s3_bucket.this

  bucket = each.value.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  for_each = aws_s3_bucket.this

  bucket = each.value.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

output "bucket_names" {
  description = "Names of the created S3 buckets."
  value       = sort(keys(aws_s3_bucket.this))
}
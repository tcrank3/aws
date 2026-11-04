terraform {
  required_version = ">= 1.13.2"

  backend "s3" {
    bucket       = "terraform-0087"
    region       = "us-east-1"
    key          = "aws/us-east-2/terraform.tfstate"
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

provider "aws" {
  region = var.aws_region
}

module "s3" {
  source       = "../modules/s3"
  bucket_names = var.bucket_names
}
terraform {
  required_version = ">= 1.16.0"

  backend "s3" {
    bucket       = "terraform-0087"
    region       = "us-east-1"
    key          = "aws/us-east-1/terraform.tfstate"
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

module "network" {
  source       = "../modules/network"
  subnets      = var.subnets
  route_tables = var.route_tables
  routes       = var.routes
  elastic_ips  = var.elastic_ips
}

module "security" {
  for_each = var.security_groups

  source        = "../modules/security"
  name          = each.key
  description   = each.value.description
  vpc_id        = module.network.vpc_id
  ingress_rules = each.value.ingress_rules
  egress_rules  = each.value.egress_rules
}

module "s3" {
  source       = "../modules/s3"
  bucket_names = var.bucket_names
}

module "iam" {
  source   = "../modules/iam"
  policies = var.iam_policies
  roles    = var.iam_roles
}
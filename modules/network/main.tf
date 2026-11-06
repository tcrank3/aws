terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

data "aws_subnet" "existing" {
  for_each = var.subnets

  id = each.value.id
}

resource "aws_subnet" "this" {
  for_each = var.subnets

  vpc_id     = data.aws_subnet.existing[each.key].vpc_id
  cidr_block = each.value.cidr_block

  tags = {
    Name = each.key
  }
}

resource "aws_route_table" "this" {
  for_each = var.route_tables

  vpc_id = data.aws_subnet.existing[each.value.subnet_key].vpc_id
}

resource "aws_route" "this" {
  for_each = var.routes

  route_table_id         = aws_route_table.this[each.value.route_table_key].id
  destination_cidr_block = each.value.destination_cidr_block
  gateway_id             = each.value.gateway_id
}

resource "aws_eip" "this" {
  for_each = var.elastic_ips

  domain = "vpc"

  tags = {
    Name = each.value
  }
}

output "vpc_id" {
  description = "VPC ID shared by the configured subnets."
  value       = one(distinct([for subnet in data.aws_subnet.existing : subnet.vpc_id]))
}

output "subnet_ids" {
  description = "IDs of the managed subnets, keyed by subnet name."
  value       = { for name, subnet in aws_subnet.this : name => subnet.id }
}

output "elastic_ip_public_ips" {
  description = "Public IPv4 addresses of the allocated Elastic IPs, keyed by Name tag."
  value       = { for name, eip in aws_eip.this : name => eip.public_ip }
}

output "elastic_ip_allocation_ids" {
  description = "Allocation IDs of the Elastic IPs, keyed by Name tag."
  value       = { for name, eip in aws_eip.this : name => eip.id }
}

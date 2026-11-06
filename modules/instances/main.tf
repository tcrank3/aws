terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile   = var.iam_instance_profile_name

  tags = {
    Name = var.name
  }
}

resource "aws_eip_association" "this" {
  allocation_id = var.eip_allocation_id
  instance_id   = aws_instance.this.id
}

output "instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.this.id
}

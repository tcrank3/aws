terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

locals {
  role_policy_attachments = {
    for attachment in flatten([
      for role_name, role in var.roles : [
        for policy_name in role.policy_names : {
          role_name   = role_name
          policy_name = policy_name
        }
      ]
    ]) : "${attachment.role_name}/${attachment.policy_name}" => attachment
  }

  managed_role_policy_attachments = {
    for attachment in flatten([
      for role_name, role in var.roles : [
        for policy_arn in role.managed_policy_arns : {
          role_name  = role_name
          policy_arn = policy_arn
        }
      ]
    ]) : "${attachment.role_name}/${attachment.policy_arn}" => attachment
  }
}

resource "aws_iam_policy" "this" {
  for_each = var.policies

  name        = each.key
  description = each.value.description
  policy      = each.value.document
}

resource "aws_iam_role" "this" {
  for_each = var.roles

  name               = each.key
  description        = each.value.description
  assume_role_policy = each.value.assume_role_policy
}

resource "aws_iam_instance_profile" "this" {
  for_each = var.roles

  name = each.key
  role = aws_iam_role.this[each.key].name
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = local.role_policy_attachments

  role       = aws_iam_role.this[each.value.role_name].name
  policy_arn = aws_iam_policy.this[each.value.policy_name].arn
}

resource "aws_iam_role_policy_attachment" "managed" {
  for_each = local.managed_role_policy_attachments

  role       = aws_iam_role.this[each.value.role_name].name
  policy_arn = each.value.policy_arn
}

output "policy_arns" {
  description = "ARNs of managed IAM policies, keyed by policy name."
  value       = { for name, policy in aws_iam_policy.this : name => policy.arn }
}

output "role_arns" {
  description = "ARNs of managed IAM roles, keyed by role name."
  value       = { for name, role in aws_iam_role.this : name => role.arn }
}

output "instance_profile_names" {
  description = "Names of instance profiles, keyed by role name."
  value       = { for name, profile in aws_iam_instance_profile.this : name => profile.name }
}

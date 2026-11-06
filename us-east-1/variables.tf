variable "aws_region" {
  description = "AWS region in which to create the bucket."
  type        = string
  default     = "us-east-1"
}

variable "bucket_names" {
  description = "Globally unique names for the S3 buckets."
  type        = list(string)
}

variable "subnets" {
  description = "Subnet CIDR blocks and existing subnet IDs to import."
  type = map(object({
    id         = string
    cidr_block = string
  }))
}

variable "route_tables" {
  description = "Existing route tables and the subnet used to look up each VPC ID."
  type = map(object({
    id         = string
    subnet_key = string
  }))
}

variable "routes" {
  description = "Routes to import into the existing route tables."
  type = map(object({
    route_table_key        = string
    destination_cidr_block = string
    gateway_id             = string
  }))
}

variable "elastic_ips" {
  description = "Name tags for Elastic IPs to allocate."
  type        = set(string)
}

variable "security_groups" {
  description = "Security groups and their IPv4 ingress and egress rules."
  type = map(object({
    description = string
    ingress_rules = map(object({
      description = string
      cidr_ipv4   = string
      ip_protocol = string
      from_port   = optional(number)
      to_port     = optional(number)
    }))
    egress_rules = map(object({
      description = string
      cidr_ipv4   = string
      ip_protocol = string
      from_port   = optional(number)
      to_port     = optional(number)
    }))
  }))
}

variable "iam_policies" {
  description = "IAM policies keyed by policy name."
  type = map(object({
    description = string
    document    = string
  }))
}

variable "iam_roles" {
  description = "IAM roles keyed by role name, with trust policies and attached policy names."
  type = map(object({
    description         = string
    assume_role_policy  = string
    policy_names        = set(string)
    managed_policy_arns = optional(set(string), [])
  }))
}

variable "instances" {
  description = "EC2 instances keyed by their Name tag."
  type = map(object({
    ami                = string
    instance_type      = string
    key_name           = string
    subnet_id          = string
    security_group_ids = set(string)
    eip_name           = string
    iam_role_name      = string
  }))
}
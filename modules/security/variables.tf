variable "name" {
  description = "Name of the security group."
  type        = string
}

variable "description" {
  description = "Description of the security group."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC containing the security group."
  type        = string
}

variable "ingress_rules" {
  description = "IPv4 ingress rules for the security group."
  type = map(object({
    description = string
    cidr_ipv4   = string
    ip_protocol = string
    from_port   = optional(number)
    to_port     = optional(number)
  }))
}

variable "egress_rules" {
  description = "IPv4 egress rules for the security group."
  type = map(object({
    description = string
    cidr_ipv4   = string
    ip_protocol = string
    from_port   = optional(number)
    to_port     = optional(number)
  }))
}

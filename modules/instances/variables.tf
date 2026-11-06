variable "name" {
  description = "Name tag value for the EC2 instance."
  type        = string
}

variable "ami" {
  description = "AMI ID to launch."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet in which to launch the instance."
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs to associate with the instance."
  type        = set(string)
}

variable "eip_allocation_id" {
  description = "Allocation ID of the Elastic IP to associate with the instance."
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile to attach."
  type        = string
}

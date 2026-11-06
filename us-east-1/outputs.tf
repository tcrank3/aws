output "subnet_ids" {
  description = "IDs of the managed subnets, keyed by subnet name."
  value       = module.network.subnet_ids
}

output "instance_ids" {
  description = "IDs of the managed EC2 instances, keyed by instance name."
  value       = { for name, instance in module.instances : name => instance.instance_id }
}
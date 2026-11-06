output "subnet_ids" {
  description = "IDs of the managed subnets, keyed by subnet name."
  value       = module.network.subnet_ids
}
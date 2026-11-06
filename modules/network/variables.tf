variable "subnets" {
  description = "Existing subnet IDs and their configured IPv4 CIDR blocks."
  type = map(object({
    id         = string
    cidr_block = string
  }))
}

variable "route_tables" {
  description = "Existing route table IDs, keyed by their associated subnet."
  type = map(object({
    id         = string
    subnet_key = string
  }))
}

variable "routes" {
  description = "Routes to manage in the existing route tables."
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

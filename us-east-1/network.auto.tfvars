subnets = {
  External_VAF = {
    id         = "subnet-0197f8019ce2b9f58"
    cidr_block = "172.16.200.0/24"
  }
  Internal_VAF = {
    id         = "subnet-0d3977b6fd2a3690f"
    cidr_block = "172.16.100.0/24"
  }
}

route_tables = {
  External_VAF = {
    id         = "rtb-05ad05c54f32cdc76"
    subnet_key = "External_VAF"
  }
  Internal_VAF = {
    id         = "rtb-059334a7c12c149ba"
    subnet_key = "Internal_VAF"
  }
}

routes = {
  Internal_VAF_igw = {
    route_table_key        = "Internal_VAF"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = "igw-0535abead5ca94e6e"
  }
}

elastic_ips = [
  "atlantis"
]

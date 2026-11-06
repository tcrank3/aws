security_groups = {
  atlantis = {
    description = "Security group for Atlantis"

    ingress_rules = {
      ssh = {
        description = "SSH from Crank House"
        cidr_ipv4   = "24.207.158.139/32"
        ip_protocol = "tcp"
        from_port   = 22
        to_port     = 22
      }
      atlantis = {
        description = "Atlantis Events"
        cidr_ipv4   = "0.0.0.0/0"
        ip_protocol = "tcp"
        from_port   = 4141
        to_port     = 4141
      }
    }

    egress_rules = {
      all_ipv4 = {
        description = "All outbound"
        cidr_ipv4   = "0.0.0.0/0"
        ip_protocol = "-1"
      }
    }
  }
}
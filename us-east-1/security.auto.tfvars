# You can get the list of GitHub IP addresses from https://api.github.com/meta.  Hooks section.

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
      atlantisCrank1 = {
        description = "Atlantis Events Crank House"
        cidr_ipv4   = "24.207.158.139/32"
        ip_protocol = "tcp"
        from_port   = 4141
        to_port     = 4141
      }
      atlantisGitHub1 = {
        description = "Atlantis Events GitHub 1"
        cidr_ipv4   = "9.234.106.48/28"
        ip_protocol = "tcp"
        from_port   = 4141
        to_port     = 4141
      }
      atlantisGitHub2 = {
        description = "Atlantis Events GitHub 2"
        cidr_ipv4   = "9.234.98.160/28"
        ip_protocol = "tcp"
        from_port   = 4141
        to_port     = 4141
      }
      atlantisGitHub3 = {
        description = "Atlantis Events GitHub 3"
        cidr_ipv4   = "9.234.98.176/28"
        ip_protocol = "tcp"
        from_port   = 4141
        to_port     = 4141
      }
      atlantisGitHub4 = {
        description = "Atlantis Events GitHub 4"
        cidr_ipv4   = "192.30.252.0/22"
        ip_protocol = "tcp"
        from_port   = 4141
        to_port     = 4141
      }
      atlantisGitHub5 = {
        description = "Atlantis Events GitHub 5"
        cidr_ipv4   = "185.199.108.0/22"
        ip_protocol = "tcp"
        from_port   = 4141
        to_port     = 4141
      }
      atlantisGitHub6 = {
        description = "Atlantis Events GitHub 6"
        cidr_ipv4   = "140.82.112.0/20"
        ip_protocol = "tcp"
        from_port   = 4141
        to_port     = 4141
      }
      atlantisGitHub7 = {
        description = "Atlantis Events GitHub 7"
        cidr_ipv4   = "143.55.64.0/20"
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
instances = {
  atlantis = {
    ami                = "ami-02a9cdd4e98bc3c78"
    instance_type      = "t3.micro"
    key_name           = "TheCrank_PEM"
    subnet_id          = "subnet-0197f8019ce2b9f58"
    security_group_ids = ["sg-098d39c04cac5a318"]
    eip_name           = "atlantis"
    iam_role_name      = "atlantis_role"
  }
}
iam_policies = {
  atlantis_policy = {
    description = "Atlantis permissions"
    document    = <<-POLICY
      {
        "Version": "2012-10-17",
        "Statement": [
          {
            "Sid": "FullS3Access",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
          },
          {
            "Action": [
                "ec2:CreateSecurityGroup",
                "ec2:DeleteSecurityGroup",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSecurityGroupReferences",
                "ec2:DescribeStaleSecurityGroups",
                "ec2:UpdateSecurityGroupRuleDescriptionsIngress",
                "ec2:UpdateSecurityGroupRuleDescriptionsEgress"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "FullSecurityGroupAccess"
        }
        ]
      }
    POLICY
  }
}

iam_roles = {
  atlantis_role = {
    description        = "Role assumed by the Atlantis EC2 instance"
    assume_role_policy = <<-TRUST
      {
        "Version": "2012-10-17",
        "Statement": [
          {
            "Effect": "Allow",
            "Principal": {
              "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
          }
        ]
      }
    TRUST
    policy_names       = ["atlantis_policy"]
    managed_policy_arns = [
      "arn:aws:iam::aws:policy/ReadOnlyAccess"
    ]
  }
}

variable "policies" {
  description = "IAM policies keyed by policy name."
  type = map(object({
    description = string
    document    = string
  }))
}

variable "roles" {
  description = "IAM roles keyed by role name, with trust policies and attached policy names."
  type = map(object({
    description        = string
    assume_role_policy = string
    policy_names       = set(string)
    managed_policy_arns = optional(set(string), [])
  }))
}

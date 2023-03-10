variable "name" {
  description = "The name to use for the prefix of all the resources"
  type        = string
}

variable "iam_role_policy" {
  type = bool
  description = "To specify the iam-role-policy file for the iam role"
}
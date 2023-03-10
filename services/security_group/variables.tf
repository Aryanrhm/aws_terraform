variable "ports" {
  type        = list(any)
  description = "list of ingress ports"
}

variable "name" {
  description = "The name to use for the Security Group Resource"
  type        = string
}
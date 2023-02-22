variable "sg_ports" {
  type        = list(any)
  description = "list of ingress ports"
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}
variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}


variable "pg-strategy" {
  description = "The Placement Group Strategy"
  type        = string
}



variable "pg-spread_level" {
  description = "The Placement Group Spread Level"
  type        = string
}

variable "name" {
  description = "The name to use for the prefix of all the resources"
  type        = string
}

variable "strategy" {
  description = "The Placement Group Strategy"
  type        = string
}

variable "spread_level" {
  description = "The Placement Group Spread Level"
  type        = string
}

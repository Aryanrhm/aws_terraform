variable "name" {
  description = "The name to use for the prefix of all the resources"
  type        = string
}

variable "performance_mode" {
  description = "The performance mode for the created efs filesystem. generalPurpose/maxIO"
  type        = string
  default = "generalPurpose"
}



variable "throughput_mode" {
  description = "The throughput mode for the created efs filesystem. bursting/provisioned/elastic"
  type        = string
  default = "bursting"
}
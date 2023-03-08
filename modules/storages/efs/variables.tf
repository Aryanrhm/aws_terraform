variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}



variable "perf_mode" {
  description = "The performance mode for the created efs filesystem. generalPurpose/maxIO"
  type        = string
  default = "generalPurpose"
}



variable "trpt_mode" {
  description = "The throughput mode for the created efs filesystem. bursting/provisioned/elastic"
  type        = string
  default = "bursting"
}
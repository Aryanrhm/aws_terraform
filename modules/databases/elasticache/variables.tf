variable "vpc_id" {
  description = "The ID of the VPC to fetch the subnet IDs"
}

variable "ec_cluster_id" {
  description = "The ID (name) for the elasticache"
} 

variable "ec_engine" {
  description = "The engine of the elasticache"
  default     = "redis"
}


variable "ec_version" {
  description = "The version of the engine to use for the Elasticache cluster"
  default     = "6.x"
}


variable "ec_az_mode" {
  description = "The availability zone mode for the Elasticache cluster"
  default     = "single-az"
}

variable "ec_node_type" {
  description = "The instance type for the Elasticache cluster nodes"
  default     = "cache.t2.micro"
}

variable "ec_nodes" {
  description = "The number of cache nodes to provision for the Elasticache cluster"
  default     = 1
}

variable "ec_port" {
  description = "The port number for the Elasticache cluster"
  default     = 6379
}


variable "ec_minor_upgrade" {
  description = "Whether to enable automatic minor version upgrades for the Elasticache cluster"
  default     = true
}

variable "ec_sec_group" {
  description = "The security group name for the Elasticache cluster"
}

variable "ec_subnet_group_name" {
  description = "The subnet group name to create and use in Elasticache cluster"
}

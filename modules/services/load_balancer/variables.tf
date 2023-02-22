variable "cluster_name" {
  description = "The name to create the Load Balancer Resources"
  type = string
}

variable "tg_port" {
  description = "The port of Target Group"
  type = number
}



variable "tg_protocol" {
    description = "The protocol of the Target Group"
    type = string
}

variable "vpc_id" {
    description = "The VPC ID of our cluster"
    type = string
}


variable "lb_sec_group_id" {
    description = "The Security Group ID for the Load Balancer"
    type = string
}




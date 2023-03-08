variable "azs" {
  type = list
  description = "The list of Availability Zones."
  
}
variable "cluster_name" {
  type = string
  description = "The cluster name to use for resources"
}

variable "image_id" {
  type = string
  description = "The id of image to use for ASG configuration"
}

variable "force_delete" {
  type = bool
  description = "To delete the Auto Scaling Group without waiting for all instances in the pool to terminate"
  default = false
}

variable "instance_type" {
  type = string
  description = "The Instance Type to use for ASG configuration"
}

variable "name" {
  type = string
  description = "The name of Auto Scaling Group to create"
}
variable "create_before_destroy" {
  type = bool
  default = true
  description = "The policy of creating new instances"
}

variable "min_size" {
  type = number
  default = 1
  description = "The Minimum numbers of instances"
}

variable "max_size" {
  type = number
  default = 3
  description = "The Maximum numbers of instances"
}

variable "desired_capacity" {
  type = number
  default = 1
  description = "The Desired numbers of instances"
}

variable "health_check_type" {
  type = string
  description = "The type of health check which can be ELB or EC2"
  default = "ELB"
}

variable "termination_policies" {
  type = string
  description = "Defining the termination policy where the oldest instance will be replaced first"
  default = "OldestInstance"
}

variable "tg_arn" {
  type = string
  description = "The arn of created target groups"
}

variable "key_name" {
  description = "The name of key to use for the ec2 instance"
  type        = string
}


variable "sg_id" {
  description = "The ID of created Security Group"
  type        = string
}









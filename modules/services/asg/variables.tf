
variable "az_list" {
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
variable "instance_type" {
  type = string
  description = "The Instance Type to use for ASG configuration"
}



variable "tg_arn" {
  type = string
  description = "The arn of created target groups"
}
variable "k_name" {
  description = "The name of key to use for the ec2 instance"
  type        = string
}


variable "sec_group_id" {
  description = "The ID of created Security Group"
  type        = string
}










 variable "efs_id" {
  description = "The ID of created efs file system"
  type        = string
}



variable "efs_subnet_id" {
  description = "The Subnet ID of instance."
  type        = string
}



variable "sg_id" {
  description = "The ID of Security Group."
  type        = string

}



variable "ec2_instance_key" {
  description = "The private key of instance to use for ssh."
  type        = string
}



variable "ec2_instance_ip" {
  description = "The IP of the created ec2 instance"
  type        = string

}
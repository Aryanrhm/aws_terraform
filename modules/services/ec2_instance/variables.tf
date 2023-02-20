variable "ami_id" {
  type        = string
  description = "The ami_id of our instance"
}
variable "instance_type" {
  type    = string
}
variable "key_name" {
  description = "Name of the key pair, which was created in aws console"
}


variable "sg_ports" {
  type        = list(any)
  description = "list of ingress ports"
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "eip" {
  description = "Adding an Elastic IP for the instance"
  type        = bool
  default = false
}

variable "ebs_size" {
  description = "The size of attached ebs"
  type        = number
}

variable "ebs_az" {
  description = "The az of ebs volume"
  type        = string
}

variable "extra_ebs" {
  description = "Adding an extra ebs volume for the instance"
  type        = bool
  default = false
}


variable "hibernate" {
  description = "Add the hibernation ability to the instance, which the root_block_encryption should be enabled either"
  type        = bool
  default = false
}

variable "root_block_encrypt" {
  description = "The ability of encrypting root block device "
  type        = bool
  default = false
}
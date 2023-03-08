variable "db_instance_class" {
  type        = string
  default     = ""
  description = "The instance class of the DataBase"
}

variable "db_identifier" {
  type = string
}

variable "db_storage" {
  type        = number
  default     = 20
  description = "The initial size of storage"

}

variable "db_engine" {
  type        = string
  description = "The type of DataBase to create"

}
variable "db_engine_version" {
  type = string

}

variable "db_storage_type" {
  type        = string
  default     = "gp2"
  description = "The type of storage we want to have for the Database instance. gp2, gp3, ..."

}

variable "db_sec_group" {
  type        = string
  description = "The id of security group to use for Database"

}

variable "db_password" {
  type      = string
  sensitive = true

}

variable "db_user_name" {
  type      = string
  sensitive = true
  default = "admin"

}

variable "db_max_storage" {
  type        = number
  description = "The maximum size of storage to scale"

}
variable "database_name" {
  type = string


}
variable "db_retention_period" {
  type        = number
  default     = 7
  description = "The retention period for the created snapshots"
}


variable "db_public_access" {
  type        = bool
  default     = false
  description = "Define the accessibility of the database to public."
}
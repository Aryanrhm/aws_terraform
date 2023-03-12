variable "cors_enable" {
    description = "To enable the Cros Origin Resource Sharing in the bucket"
    type = bool
    default = false
}

variable "cors_rules" {
    type = any
    description = "The CORS rules to include in the creating bucket"  
}

variable "bucket_name" {
    description = "The name for the bucket to create"
    type = string 
}

variable "bucket_acl" {
    description = "To define the acl for the bucket. private/public"
    type = string
    default = "private"
}

variable "bucket_versioning_status" {
    description = "To activate the versioning for the bucket. Enabled/Disabled"
    type = string
    default = "Enabled"
}

variable "target_log_bucket" {
    description = "To define the name of bucket for the log of the creating bucket."
    type = string
}

variable "target_bucket_prefix" {
    description = "Prefix for all log object keys."
}

variable "lock_retention_mode" {
    description = "Default Object Lock retention mode you want to apply to new objects placed in the specified bucket. COMPLIANCE/GOVERNANCE"
    type = string
    default = "COMPLIANCE"  
}

variable "lock_retention_days" {
    description = "Number of days that you want to specify for the default retention period."
    type = number
    default = 5
}

variable "object_lock_enabled" {
    description = "Indicates whether this bucket has an Object Lock configuration enabled."
    type = bool
    default = false
}


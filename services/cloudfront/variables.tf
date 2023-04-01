variable "create_origin_access_control" {
  description = "To create a CloudFront origin access control"
  type        = bool
  default     = false
}

variable "origin_access_control" {
  description = "A map to create an AWS CloudFront Origin Access Control, which is used by CloudFront Distributions with an Amazon S3 bucket as the origin."
  type = map(object({
    description      = string
    origin_type      = string
    signing_behavior = string
    signing_protocol = string
  }))
}

variable "origin" {
  description = "A map to specify one or more origins for this distribution (multiples allowed)."
  type = any
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content."
  type    = bool
  default = false
}

variable "ipv6_enabled" {
  description = "Whether the IPv6 is enabled for the distribution."
  type        = bool
  default     = false
}

variable "comment" {
  type = string
}

variable "tags" {
  description = "A map of tags to assign to the distribution"
  type        = map(string)
}

variable "default_root_object" {
  description = "Object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type        = string
}

variable "logging" {
  
  description = "The logging configuration that controls how logs are written to your distribution (maximum one)."
  type = any
}

variable "aliases" {
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution."
  type    = list(string)
  default = null
}

variable "default_cache_behavior" {
  description = "Default cache behavior for this distribution (maximum one)."
  type = any
}

variable "ordered_cache_behavior" {
  description = "Ordered list of cache behaviors resource for this distribution. List from top to bottom in order of precedence. The topmost cache behavior will have precedence 0."
  type = any
}

variable "geo_restriction" {
  description = "The restrictions for this distribution"
  type = any
}

variable "viewer_certificate" {
  description = "The SSL configuration for this distribution (maximum one)."
  type = any
}

variable "price_class" {
  description = " Price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100."
  type = string
}
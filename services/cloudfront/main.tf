locals {
  create_origin_access_control = var.create_origin_access_control && length(keys(var.origin_access_control)) > 0
}

resource "aws_cloudfront_origin_access_control" "this" {
  for_each                          = local.create_origin_access_control ? var.origin_access_control : {}
  name                              = each.key
  description                       = each.value["description"]
  origin_access_control_origin_type = each.value["origin_type"]
  signing_behavior                  = each.value["signing_behavior"]
  signing_protocol                  = each.value["signing_protocol"]
}

resource "aws_cloudfront_distribution" "this" {
  dynamic "origin" {
    for_each = var.origin

    content {
      domain_name              = origin.value.domain_name
      origin_id                = lookup(origin.value, "origin_id", origin.key)
      origin_access_control_id = lookup(origin.value, "origin_access_control_id", lookup(lookup(aws_cloudfront_origin_access_control.this, lookup(origin.value, "origin_access_control", ""), {}), "id", null))
    }
  }

  enabled             = var.enabled
  is_ipv6_enabled     = var.ipv6_enabled
  comment             = var.comment
  default_root_object = var.default_root_object

  dynamic "logging_config" {
    for_each = length(keys(var.logging)) == 0 ? null : [var.logging]
    content {
      include_cookies = lookup(var.logging, "include_cookies", null)
      bucket          = lookup(var.logging, "bucket", null)
      prefix          = lookup(var.logging, "prefix", null)
    }
  }

  aliases = var.aliases

  dynamic "default_cache_behavior" {
    for_each = [var.default_cache_behavior]
    iterator = i
    content {
      allowed_methods        = lookup(var.default_cache_behavior, "allowed_methods", null)
      cached_methods         = lookup(var.default_cache_behavior, "cached_methods", null)
      target_origin_id       = lookup(var.default_cache_behavior, "target_origin_id", null)
      viewer_protocol_policy = lookup(var.default_cache_behavior, "viewer_protocol_policy", null)
      min_ttl                = lookup(var.default_cache_behavior, "min_ttl", null)
      default_ttl            = lookup(var.default_cache_behavior, "default_ttl", null)
      max_ttl                = lookup(var.default_cache_behavior, "max_ttl", null)
      dynamic "forwarded_values" {
        for_each = lookup(var.default_cache_behavior, "use_forwarded_values", true) ? [true] : []

        content {
          query_string            = lookup(i.value, "query_string", false)
          query_string_cache_keys = lookup(i.value, "query_string_cache_keys", [])
          headers                 = lookup(i.value, "headers", [])

          cookies {
            forward           = lookup(i.value, "cookies_forward", "none")
            whitelisted_names = lookup(i.value, "cookies_whitelisted_names", null)
          }
        }
      }
    }
  }


  dynamic "ordered_cache_behavior" {
    for_each = [var.ordered_cache_behavior]
    iterator = i
    content {
      allowed_methods        = lookup(i.value, "allowed_methods", null)
      cached_methods         = lookup(i.value, "cached_methods", null)
      target_origin_id       = lookup(i.value, "target_origin_id", null)
      viewer_protocol_policy = lookup(i.value, "viewer_protocol_policy", null)
      min_ttl                = lookup(i.value, "min_ttl", null)
      default_ttl            = lookup(i.value, "default_ttl", null)
      max_ttl                = lookup(i.value, "max_ttl", null)
      path_pattern           = lookup(i.value, "path_pattern", null)
      compress               = lookup(i.value, "compress", null)

      dynamic "forwarded_values" {
        for_each = lookup(var.ordered_cache_behavior, "use_forwarded_values", true) ? [true] : []

        content {
          query_string            = lookup(i.value, "query_string", false)
          query_string_cache_keys = lookup(i.value, "query_string_cache_keys", [])
          headers                 = lookup(i.value, "headers", [])

          cookies {
            forward           = lookup(i.value, "cookies_forward", "none")
            whitelisted_names = lookup(i.value, "cookies_whitelisted_names", null)
          }
        }
      }
    }
  }

  price_class = var.price_class

  restrictions {
    dynamic "geo_restriction" {
      for_each = [var.geo_restriction]
      content {

        restriction_type = lookup(var.geo_restriction, "restriction_type", null)
        locations        = lookup(var.geo_restriction, "locations", null)
      }
    }
  }
  tags = var.tags


  viewer_certificate {
    cloudfront_default_certificate = lookup(var.viewer_certificate, "cloudfront_default_certificate", true)
    minimum_protocol_version       = lookup(var.viewer_certificate, "minimum_protocol_version", "TLSv1")
  }
}
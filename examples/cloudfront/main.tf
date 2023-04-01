locals {
  s3_origin_id = "myS3"
}

data "aws_s3_bucket" "selected" {
  bucket = "test-bucket"
}

module "cloudfront" {
  source                       = "git::https://github.com/Aryanrhm/aws-terraform-modules.git//services/cloudfront"
  enabled                      = true
  ipv6_enabled                 = true
  comment                      = "Cloudfront Test"
  default_root_object          = "index.html"
  create_origin_access_control = true
  origin_access_control = {
    s3 = {
      description      = "test",
      origin_type      = "s3",
      signing_behavior = "always",
      signing_protocol = "sigv4"
    }
  }
  origin = {
    s3 = {
      domain_name           = data.aws_s3_bucket.selected.bucket_domain_name
      origin_id             = local.s3_origin_id
      origin_access_control = "s3"
    }
  }
  logging = {
    include_cookies = false
    bucket          = "test-bucket-log.s3.amazonaws.com"
    prefix          = "myprefix"
  }

  tags = {
    Environment = "production"
  }
  default_cache_behavior = {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.s3_origin_id
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
  ordered_cache_behavior = {
    path_pattern           = "/*"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = local.s3_origin_id
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }
  price_class = "PriceClass_200"
  geo_restriction = {
    restriction_type = "whitelist",
    locations        = ["US", "CA", "GB", "DE"]
  }
  viewer_certificate = {
    cloudfront_default_certificate = true
  }
}
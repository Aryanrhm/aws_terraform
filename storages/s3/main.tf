
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name  
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.bucket_versioning_status
  }
}


resource "aws_s3_bucket_cors_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  dynamic "cors_rule" {
    for_each = var.cors_rules 
    content {
      allowed_headers = try(cors_rule.value.allowed_headers, null)
      allowed_methods = try(cors_rule.value.allowed_methods, null)
      allowed_origins = try(cors_rule.value.allowed_origins, null)
      expose_headers  = try(cors_rule.value.expose_headers, null)
      max_age_seconds = try(cors_rule.value.max_age_seconds, null)
    }
  }
}

resource "aws_s3_bucket_logging" "this" {
  bucket = aws_s3_bucket.this.id

  target_bucket = var.target_log_bucket
  target_prefix = var.target_bucket_prefix
}


resource "aws_s3_bucket_object_lock_configuration" "this" {
  count = var.object_lock_enabled ? 1 : 0 
  bucket = aws_s3_bucket.this.id
  rule {
    default_retention {
      mode = var.lock_retention_mode
      days = var.lock_retention_days
    }
  }
}
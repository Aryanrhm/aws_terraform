
resource "aws_s3_bucket" "my_s3" {
  bucket = var.s3_bucket_name
  region = var.s3_region
  
}

resource "aws_s3_bucket_acl" "my_s3" {
  bucket = aws_s3_bucket.example.id
  acl    = var.s3_acl
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Disabled"
  }
}

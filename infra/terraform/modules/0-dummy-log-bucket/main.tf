################################################################################
# Logを集約するためのS3バケット
################################################################################
resource "aws_s3_bucket" "this" {
  bucket        = var.bucket_name
  acl           = "private"
  tags          = var.common_tags
  force_destroy = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

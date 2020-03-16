################################################################################
# Athena DB
################################################################################
resource "aws_athena_database" "this" {
  name   = var.athena_database_name
  bucket = var.log_bucket_name
}

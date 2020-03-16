################################################################################
# Main
################################################################################
module "main" {
  source               = "../../../modules/3-athena-database/"
  athena_database_name = local.athena_database_name
  log_bucket_name      = local.log_bucket_name
}

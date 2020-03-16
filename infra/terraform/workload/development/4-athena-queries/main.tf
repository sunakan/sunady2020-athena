################################################################################
# Main
################################################################################
module "main" {
  source                = "../../../modules/4-athena-queries/"
  athena_database_name  = local.athena_database_name
  athena_table_name     = local.athena_table_name
  athena_workgroup_name = local.athena_workgroup_name
  log_bucket_name       = local.log_bucket_name
}

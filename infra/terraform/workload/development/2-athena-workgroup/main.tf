################################################################################
# Main
################################################################################
module "main" {
  source                    = "../../../modules/2-athena-workgroup/"
  athena_workgroup_name     = local.athena_workgroup_name
  athena_result_bucket_name = local.athena_result_bucket_name
  common_tags               = local.common_tags
}

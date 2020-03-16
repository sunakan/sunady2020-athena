################################################################################
# Main
################################################################################
module "main" {
  source      = "../../../modules/1-athena-result-bucket/"
  bucket_name = local.athena_result_bucket_name
  common_tags = local.common_tags
}

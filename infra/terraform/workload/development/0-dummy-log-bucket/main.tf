################################################################################
# Main
################################################################################
module "main" {
  source      = "../../../modules/0-dummy-log-bucket/"
  bucket_name = local.log_bucket_name
  common_tags = local.common_tags
}

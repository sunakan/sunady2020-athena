################################################################################
# Main
################################################################################
module "main" {
  source                = "../../../modules/0-dummy-log-bucket/"
    bucket_name = local.service_name_with_env
    common_tags = local.common_tags
}

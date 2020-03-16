################################################################################
# Main
################################################################################
module "main" {
  source                           = "../../../modules/5-athena-iam/"
  service_name_with_env_for_athena = "${local.service_name_with_env}-for-athena"
  common_tags                      = local.common_tags
}

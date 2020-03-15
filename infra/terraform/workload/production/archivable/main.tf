################################################################################
# Main
################################################################################
module "main" {
  source                = "./archivable-module/"
  common_tags           = merge(local.common_tags, { environment = local.env_full })
  service_name_with_env = local.service_name_with_env
}

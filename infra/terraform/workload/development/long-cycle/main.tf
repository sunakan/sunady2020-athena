################################################################################
# data_resourceでとってくる既存のAWSリソースの情報
################################################################################
data "aws_s3_bucket" "log_bucket" {
  bucket = local.service_name_with_env
}

################################################################################
# Main
################################################################################
module "main" {
  source                = "./long-cycle-module/"
  common_tags           = merge(local.common_tags, { environment = local.env_full })
  service_name_with_env = local.service_name_with_env
  log_bucket_arn        = data.aws_s3_bucket.log_bucket.arn
}

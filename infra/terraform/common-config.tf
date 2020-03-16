################################################################################
# Terraform自体のバージョン
# terraform-providerのバージョン
# シンボリックリンクとして利用する理由
#   - Terraform用のディレクトリ毎にバージョンを上げるとき、面倒なため
################################################################################
terraform {
  required_version = "0.12.23"
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = var.target_aws_account_profile
}

################################################################################
# 前提：~/.aws/credentialで[AWS_PROFILE]を設定済み
# terraform.tfvars
#   target_aws_account_profile = "development"
################################################################################
variable "target_aws_account_profile" {
  description = "[required] Terraform用のIAMuser/IAMroleのプロフィール名"
  type        = string
  default     = "AWS_PROFILE"
}

################################################################################
# workload間で共通するlocal変数
################################################################################
variable "environment" {
  description = "[required] 環境名：候補はdevelopment/staging/production"
  type        = string
}

locals {
  env_full = var.environment
  env_short = map(
    "development", "dev",
    "staging", "stg",
    "production", "prd",
  )[local.env_full]
  service_name_with_env = "suna-athena-sample-${local.env_short}"
  log_bucket_name       = "suna-athena-sample-${local.env_short}"
  common_tags = {
    github      = "sunakan/sunady2020-athena"
    environment = local.env_full
  }
  athena_result_bucket_name = "${local.service_name_with_env}-for-athena"
  athena_workgroup_name     = local.service_name_with_env
}

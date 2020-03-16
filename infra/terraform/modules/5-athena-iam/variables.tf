variable "service_name_with_env_for_athena" {
  description = "[Required] IAM関連の一連のリソースの名前に利用"
  type        = string
}

variable "common_tags" {
  description = "[Optional] 共通タグ"
  type        = map(string)
  default     = {}
}

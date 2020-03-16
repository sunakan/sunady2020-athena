variable "athena_workgroup_name" {
  description = "[Required] Athenaのワークグループ名"
  type        = string
}

variable "athena_result_bucket_name" {
  description = "[Required] Athenaワークグループのクエリ結果の置き場所"
  type        = string
}

variable "common_tags" {
  description = "[Optional] 共通タグ"
  type        = map(string)
  default     = {}
}

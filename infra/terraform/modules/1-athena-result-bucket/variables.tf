variable "bucket_name" {
  description = "[Required] S3バケット名"
  type        = string
}

variable "common_tags" {
  description = "[Optional] 共通タグ"
  type        = map(string)
  default     = {}
}

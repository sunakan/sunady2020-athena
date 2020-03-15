variable "common_tags" {
  description = "[optional] 共通するタグ"
  type        = map(string)
  default     = {}
}

variable "service_name_with_env" {
  description = "[required] 末尾に環境名付きサービス名"
  type        = string
}

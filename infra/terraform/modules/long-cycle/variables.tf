variable "common_tags" {
  description = "[optional] 共通するタグ"
  type        = map(string)
  default     = {}
}

variable "service_name_with_env" {
  description = "[required] 末尾に環境名付きサービス名"
  type        = string
}

variable "log_bucket_arn" {
  description = "[required] Log用バケットのARN"
  type        = string
}

variable "log_bucket_name" {
  description = "[required] Log用バケットの名前"
  type        = string
}

variable "athena_database_name" {
  description = "[Required] AthenaのDB名"
  type        = string
}

variable "log_bucket_name" {
  description = "[Required] AthenaのDBが参照するS3バケット名"
  type        = string
}

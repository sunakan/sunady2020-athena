################################################################################
# 特定のS3バケットだけ に Putができる だけ
################################################################################
data "aws_iam_policy_document" "log_bucket_policy" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [var.log_bucket_arn]
  }
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["${var.log_bucket_arn}/*"]
  }
}
resource "aws_iam_user" "logging_user" {
  name = "${var.service_name_with_env}-logging-user"
  path = "/app/"
  tags = var.common_tags
}
resource "aws_iam_user_policy" "attach" {
  name   = "${var.service_name_with_env}-put-only"
  user   = aws_iam_user.logging_user.name
  policy = data.aws_iam_policy_document.log_bucket_policy.json
}

################################################################################
# Athena DB
################################################################################
resource "aws_athena_database" "this" {
  name   = replace(var.service_name_with_env, "-", "_")
  bucket = var.log_bucket_name
}

################################################################################
# Athena Working Group
################################################################################
resource "aws_athena_workgroup" "this" {
  name = var.service_name_with_env
  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
    result_configuration {
      output_location = "s3://${var.log_bucket_name}/athena-result/"
    }
  }
}

################################################################################
# Athena のクエリ
################################################################################
data "template_file" "create_table_sql" {
  template = "${file("${path.module}/sql/create-table.sql.tpl")}"
  vars = {
    athena_db_name    = aws_athena_database.this.id
    athena_table_name = aws_athena_database.this.id
    s3_bucket_name    = var.log_bucket_name
  }
}
resource "aws_athena_named_query" "create_table" {
  name      = "Setup athena table for ${var.service_name_with_env}"
  workgroup = aws_athena_workgroup.this.id
  database  = aws_athena_database.this.id
  query     = data.template_file.create_table_sql.rendered
}

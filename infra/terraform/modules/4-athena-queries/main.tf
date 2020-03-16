################################################################################
# Athena のクエリ
################################################################################
data "template_file" "create_table_sql" {
  template = file("${path.module}/sql/create-table.sql.tpl")
  vars = {
    athena_database_name = var.athena_database_name
    athena_table_name    = var.athena_table_name
    log_bucket_name      = var.log_bucket_name
  }
}
resource "aws_athena_named_query" "create_table" {
  name        = "Create table"
  description = "テーブル作成するだけ"
  workgroup   = var.athena_workgroup_name
  database    = var.athena_database_name
  query       = data.template_file.create_table_sql.rendered
}

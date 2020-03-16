################################################################################
# Athena Workgroup
################################################################################
resource "aws_athena_workgroup" "this" {
  name = var.athena_workgroup_name
  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
    result_configuration {
      output_location = "s3://${var.athena_result_bucket_name}/athena-result/"
    }
  }
  tags = var.common_tags
}

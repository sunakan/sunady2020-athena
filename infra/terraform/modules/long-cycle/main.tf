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

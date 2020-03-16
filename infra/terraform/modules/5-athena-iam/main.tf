################################################################################
# Athenaへのアクセス最小権限（クエリ結果もAthenaを通す）
################################################################################
data "aws_iam_policy_document" "this" {
  statement {
    effect  = "Allow"
    actions = [
      "sts:GetCallerIdentity",
    ]
    resources = ["*"]
  }
}
resource "aws_iam_policy" "this" {
  name   = var.service_name_with_env_for_athena
  policy = data.aws_iam_policy_document.this.json
}
resource "aws_iam_group" "this" {
  name = var.service_name_with_env_for_athena
  path = "/apps/"
}
resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.this.name
  policy_arn = aws_iam_policy.this.arn
}
resource "aws_iam_user" "this" {
  name = var.service_name_with_env_for_athena
  path = "/apps/"
  tags = var.common_tags
}
resource "aws_iam_user_group_membership" "this" {
  user = aws_iam_user.this.name
  groups = [
    aws_iam_group.this.name,
  ]
}

data "aws_iam_policy_document" "cloudops_trust" {
  statement {
    sid    = "AllowCloudOpsUsersWithMFA"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::420606830971:root"
      ]
    }
    actions = ["sts:AssumeRole"]
    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}

data "aws_iam_policy_document" "cloudops_policy" {
  statement {
    sid    = "AllowDynamoDBListTables"
    effect = "Allow"
    actions = [
      "dynamodb:ListTables",
      "dynamodb:DescribeTable",
      "dynamodb:Scan",
    ]
    resources = ["*"]
  }
}

module "group_access_cloudops" {
  source             = "./modules/iam-role"
  name               = "GroupAccess-CloudOps"
  description        = "CloudOps IAM role for cross-account access with MFA enforcement."
  assume_role_policy = data.aws_iam_policy_document.cloudops_trust.json
  policy_arns = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ]
  policy_documents_json = {
    ddb = data.aws_iam_policy_document.cloudops_policy.json
  }
  tags = {
    Team = "CloudOps"
  }
}
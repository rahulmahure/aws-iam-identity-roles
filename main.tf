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

data "aws_iam_policy_document" "cloudops_custom_policy" {
  statement {
    actions = [
      "dynamodb:ListTables",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role" "cloudops" {
  name               = var.cloudops_role_name
  assume_role_policy = data.aws_iam_policy_document.cloudops_trust.json
  description        = "CloudOps IAM role for cross-account access with MFA enforcement."
}

resource "aws_iam_role_policy_attachment" "cloudops_aws_policy" {
  role       = aws_iam_role.cloudops.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy" "cloudops_custom_policy" {
  name   = "${var.cloudops_role_name}-cloudops-custom-policy"
  role   = aws_iam_role.cloudops.id
  policy = data.aws_iam_policy_document.cloudops_custom_policy.json
}
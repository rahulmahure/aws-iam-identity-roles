resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = var.assume_role_policy
  description        = var.description
  tags               = var.tags
}

# Existing AWS Managed policies
resource "aws_iam_role_policy_attachment" "managed" {
  for_each   = toset(var.policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = each.value
}

# Create customer-managed policies
resource "aws_iam_policy" "custom_policies" {
  for_each    = var.policy_documents_json
  name        = "${var.name}-${each.key}"
  description = "Customer managed policy for ${var.name}"
  policy      = each.value
  tags        = var.tags
}

# Attach customer-managed policies
resource "aws_iam_role_policy_attachment" "custom_policies_attachment" {
  for_each   = aws_iam_policy.custom_policies
  policy_arn = each.value.arn
  role       = aws_iam_role.this.name
}
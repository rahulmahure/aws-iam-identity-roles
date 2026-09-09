output "role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.this.name
}

output "role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.this.arn
}

output "role_id" {
  description = "ID of the IAM role"
  value       = aws_iam_role.this.id
}

output "custom_policy_arns" {
  description = "ARNs of the customer-managed IAM policies created by this module"
  value = {
    for key, policy in aws_iam_policy.custom_policies :
    key => policy.arn
  }
}
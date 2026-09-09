output "cloudops_role_name" {
  description = "CloudOps IAM role name"
  value       = module.group_access_cloudops.role_name
}

output "cloudops_role_arn" {
  description = "CloudOps IAM role ARN"
  value       = module.group_access_cloudops.role_arn
}

output "cloudops_custom_policy_arns" {
  description = "CloudOps customer-managed policy ARNs"
  value       = module.group_access_cloudops.custom_policy_arns
}
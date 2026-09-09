variable "name" {
  description = "Name of the IAM role"
  type        = string
}

variable "description" {
  description = "Description of the IAM role"
  type        = string
  default     = null
}

variable "assume_role_policy" {
  description = "IAM trust policy for the role"
  type        = string
}

variable "policy_arns" {
  description = "List of existing managed policy ARNs to attach to the IAM role"
  type        = list(string)
  default     = []
}

variable "policy_documents_json" {
  description = "Map of customer-managed IAM policy names to policy JSON documents"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to IAM resources"
  type        = map(string)
  default     = {}
}
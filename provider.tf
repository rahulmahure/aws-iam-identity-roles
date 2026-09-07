provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      Project     = "aws-iam-identity-roles"
      Environment = "test"
      ManagedBy   = "Terraform"
    }
  }
}
provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      Project     = "https://github.com/rahulmahure/aws-iam-identity-roles.git"
      Environment = "prod"
      ManagedBy   = "CloudOps"
    }
  }
}
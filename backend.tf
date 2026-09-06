terraform {
  backend "s3" {
    bucket         = "test-terraform-state-aws-identity-roles"
    key            = "identity-roles/terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile   = true
    encrypt        = true
  }
}
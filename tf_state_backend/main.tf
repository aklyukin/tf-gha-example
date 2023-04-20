provider "aws" {
  region = "us-east-1"
}

module "terraform_state_backend" {
  source     = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=tags/0.39.0"
  namespace  = "tf-gha-example"
  stage      = "prod"
  name       = "terraform"
  attributes = ["state"]

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
  block_public_policy                = "true"
  block_public_acls                  = "true"
  restrict_public_buckets            = "true"
  ignore_public_acls                 = "true"
}

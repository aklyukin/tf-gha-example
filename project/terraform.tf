terraform {
  required_version = ">= 1.4"

  backend "s3" {
    region               = "us-east-1"
    bucket               = "tf-gha-example-prod-terraform-state"
    key                  = "project.tfstate"
    workspace_key_prefix = "project"
    dynamodb_table       = "tf-gha-example-prod-terraform-state-lock"
    encrypt              = "true"
  }
}

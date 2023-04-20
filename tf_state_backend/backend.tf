terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "us-east-1"
    bucket         = "tf-gha-example-prod-terraform-state"
    key            = "terraform.tfstate"
    dynamodb_table = "tf-gha-example-prod-terraform-state-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}

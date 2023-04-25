#############################################################
# Terraform CI/CD User
#############################################################

module "tf_cicd_user" {
  source    = "git::https://github.com/cloudposse/terraform-aws-iam-system-user.git?ref=tags/1.1.0"
  delimiter = var.delimiter
  name      = var.name
  namespace = var.namespace
  stage     = "prod"
  tags      = var.tags

  policy_arns_map = {
    logs = "arn:aws:iam::aws:policy/AdministratorAccess"
  }
}
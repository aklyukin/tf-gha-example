#############################################################
# Labels
#############################################################

module "super_host_label" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"

  namespace  = var.namespace
  stage      = terraform.workspace
  name       = var.name
  attributes = compact(concat(var.attributes, ["super"]))
  delimiter  = var.delimiter
  tags       = var.tags
}

#############################################################
# EC2 Host
#############################################################

module "aws_key_pair" {
  source  = "cloudposse/key-pair/aws"
  version = "0.18.3"
  context = module.super_host_label.context

  ssh_public_key_path = var.ssh_public_key_path
  generate_ssh_key    = true
}

module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.0.0"
  context = module.super_host_label.context

  ipv4_primary_cidr_block = "172.16.0.0/16"
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.1.0"
  context = module.super_host_label.context

  availability_zones   = var.availability_zones
  vpc_id               = module.vpc.vpc_id
  igw_id               = [module.vpc.igw_id]
  ipv4_cidr_block      = [module.vpc.vpc_cidr_block]
  nat_gateway_enabled  = false
  nat_instance_enabled = false
}

module "ec2_server" {
  source  = "git::https://github.com/cloudposse/terraform-aws-ec2-instance.git?ref=tags/0.47.1"
  context = module.super_host_label.context

  instance_type = var.ec2_instance_type
  vpc_id        = module.vpc.vpc_id
  subnet        = module.subnets.public_subnet_ids[0]
}

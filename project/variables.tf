variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region identifier"
}

variable "namespace" {
  type        = string
  default     = "tfghaexample"
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "stage" {
  type        = string
  default     = "prod"
  description = "Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release'"
}

variable "name" {
  type        = string
  default     = "project"
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. `{ BusinessUnit = \"XYZ\" }`"
}

#############################################################

variable "ec2_instance_type" {
  type        = string
  default     = "t2.nano"
  description = "EC2 instance type"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "/secrets"
  description = "Path to SSH public key directory (e.g. `/secrets`)"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones where subnets will be created"
}

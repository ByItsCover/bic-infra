# General AWS

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

# Terraform Cloud

variable "tfe_org_name" {
  type        = string
  description = "Terraform Cloud organization name"
  default     = "ByItsCover"
}

variable "tfc_aws_auth" {
  type        = bool
  description = "Terraform Cloud AWS Provider Auth"
  default     = true
}

variable "tfc_aws_plan_role" {
  type        = bool
  description = "Terraform Cloud AWS Plan Role"
  sensitive   = true
}

variable "tfc_aws_apply_role" {
  type        = bool
  description = "Terraform Cloud AWS Apply Role"
  sensitive   = true
}

# Aurora RDS

variable "rds_cluster_id" {
  type        = string
  description = "AWS RDS cluster identifier"
}

variable "rds_database_name" {
  type        = string
  description = "AWS RDS database name"
}

variable "rds_master_username" {
  type        = string
  description = "AWS RDS master user username"
}

variable "rds_scaling_config" {
  type        = map(any)
  description = "AWS RDS scaling configuration"
  default = {
    max_capacity             = 1.0
    min_capacity             = 0.0
    seconds_until_auto_pause = 300
  }
}

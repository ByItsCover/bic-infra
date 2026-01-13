# General AWS

variable "aws_region" {
  type        = string
  description = "AWS Region"
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

# Elastic Container Registry

variable "ecr_repo_name" {
  type        = string
  description = "Elastic Container Registry Repository Name"
}

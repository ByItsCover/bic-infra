aws_region = "us-east-2"

# RDS

rds_cluster_id      = "covercluster"
rds_database_name   = "coverdb"
rds_master_username = "tester"
rds_scaling_config = {
  max_capacity             = 1.0
  min_capacity             = 0.0
  seconds_until_auto_pause = 300
}

# ECR

ecr_repo_name = "cover-repository"

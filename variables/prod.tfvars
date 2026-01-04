aws_region  = "us-east-2"

tfe_org_name      = "ByItsCover"
tfe_workspace_project = "ByItsCover_PROD"
tfe_workspace_name    = "bic-infra-prod"

rds_cluster_id      = "covercluster"
rds_database_name   = "coverdb"
rds_master_username = "tester"
rds_master_password = "testpass"
rds_scaling_config = {
  max_capacity             = 1.0
  min_capacity             = 0.0
  seconds_until_auto_pause = 300
}

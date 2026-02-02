resource "random_password" "master" {
  length           = 16
  special          = true
  override_special = "_!%^"
}

resource "aws_secretsmanager_secret" "password" {
  name = "cover-db-password"
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id     = aws_secretsmanager_secret.password.id
  secret_string = random_password.master.result
}


resource "aws_rds_cluster" "covercluster" {
  cluster_identifier     = var.rds_cluster_id
  engine                 = "aurora-postgresql"
  engine_mode            = "provisioned"
  engine_version         = "17.4"
  database_name          = var.rds_database_name
  master_username        = var.rds_master_username
  master_password        = aws_secretsmanager_secret_version.password.secret_string
  storage_encrypted      = true
  skip_final_snapshot    = true
  apply_immediately      = true
  enable_http_endpoint   = true
  vpc_security_group_ids = [aws_security_group.rds.id]

  serverlessv2_scaling_configuration {
    max_capacity             = var.rds_scaling_config.max_capacity
    min_capacity             = var.rds_scaling_config.min_capacity
    seconds_until_auto_pause = var.rds_scaling_config.seconds_until_auto_pause
  }
}

resource "aws_rds_cluster_instance" "covercluster_instance" {
  cluster_identifier = aws_rds_cluster.covercluster.id
  instance_class     = "db.serverless"
  engine             = aws_rds_cluster.covercluster.engine
  engine_version     = aws_rds_cluster.covercluster.engine_version
}
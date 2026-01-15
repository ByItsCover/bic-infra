# RDS

output "db_master_username" {
  value = var.rds_master_username
}

output "db_master_password" {
  value     = aws_secretsmanager_secret_version.password.secret_string
  sensitive = true
}

# ECR

output "ecr_repo_url" {
  value     = aws_ecr_repository.cover_repository.repository_url
  sensitive = true
}

# EFS

output "efs_sg_id" {
  value = aws_security_group.efs.id
}

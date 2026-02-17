# Roles

output "lambda_function_role_arn" {
  value = aws_iam_role.lambda_function_role.arn
}

output "batch_service_role_arn" {
  value = aws_iam_role.batch_service_role.arn
}

output "ecs_instance_role_arn" {
  value = aws_iam_instance_profile.ecs_instance_role.arn
}

output "ecs_execution_role_arn" {
  value = aws_iam_role.ecs_role.arn
}

# RDS

output "db_endpoint" {
  value = aws_rds_cluster.covercluster.endpoint
}

output "db_master_username" {
  value = var.rds_master_username
}

output "db_master_password" {
  value     = aws_secretsmanager_secret_version.password.secret_string
  sensitive = true
}

# ECR

output "embed_server_ecr_name" {
  value = aws_ecr_repository.embed_server.name
}

output "listopia_parser_ecr_name" {
  value = aws_ecr_repository.listopia_parser.name
}

# Batch

output "batch_sg_id" {
  value = aws_security_group.batch.id
}

# API Gateway

output "api_gw_id" {
  value = aws_apigatewayv2_api.embed_api.id
}

output "api_gw_arn" {
  value = aws_apigatewayv2_api.embed_api.execution_arn
}

# SQS

output "sqs_arn" {
  value = aws_sqs_queue.embed_queue.arn
}

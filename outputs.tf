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
# S3

output "s3_site_bucket_id" {
  value = aws_s3_bucket.site_bucket.id
}

output "s3_site_bucket_regional_domain" {
  value = aws_s3_bucket.site_bucket.bucket_regional_domain_name
}

output "s3_db_uri" {
  value = "s3://${aws_s3_bucket.cover_bucket.bucket}/${aws_s3_object.coverdb.key}"
}

# CloudFront

output "cf_access_control_id" {
  value = aws_cloudfront_origin_access_control.current.id
}

output "cf_request_policy_id" {
  value = aws_cloudfront_origin_request_policy.cdn.id
}

output "cf_response_policy_id" {
  value = aws_cloudfront_response_headers_policy.cdn.id
}

output "cf_cache_policy_id" {
  value = aws_cloudfront_cache_policy.cdn.id
}

# ECR

output "embed_server_ecr_name" {
  value = aws_ecr_repository.embed_server.name
}

output "listopia_parser_ecr_name" {
  value = aws_ecr_repository.listopia_parser.name
}

output "library_search_ecr_name" {
  value = aws_ecr_repository.library_search.name
}

# Batch

output "batch_sg_id" {
  value = aws_security_group.batch.id
}

# API Gateway

output "api_gw_id" {
  value = aws_apigatewayv2_api.search_api.id
}

output "api_gw_arn" {
  value = aws_apigatewayv2_api.search_api.execution_arn
}

# SQS

output "sqs_arn" {
  value = aws_sqs_queue.embed_queue.arn
}

output "sqs_url" {
  value = aws_sqs_queue.embed_queue.url
}

# APIs

output "hardcover_secret_arn" {
  value = aws_secretsmanager_secret_version.hardcover_key.secret_arn
}

output "hardcover_secret_name" {
  value = aws_secretsmanager_secret.hardcover_key.name
}

# Cognito

output "auth_user_pool_id" {
  value = aws_cognito_user_pool.auth_pool.id
}

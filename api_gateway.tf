resource "aws_apigatewayv2_api" "recommend_api" {
  name          = "recommend-api"
  protocol_type = "HTTP"

  cors_configuration {
    allow_origins     = ["https://${var.domain_name}", "https://www.${var.domain_name}"]
    allow_methods     = ["POST", "GET", "OPTIONS"]
    allow_headers     = ["Content-Type", "Authorization"]
    allow_credentials = true
    max_age           = 300
  }
}

resource "aws_apigatewayv2_stage" "recommend_stage" {
  api_id = aws_apigatewayv2_api.recommend_api.id

  name        = "$default"
  auto_deploy = true

  lifecycle {
    create_before_destroy = true
  }
}

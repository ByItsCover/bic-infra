resource "aws_apigatewayv2_api" "search_api" {
  name          = "search-api"
  protocol_type = "HTTP"

  cors_configuration {
    allow_origins = ["http://${aws_s3_bucket.site_bucket.id}.s3-website.${var.aws_region}.amazonaws.com"]
    allow_methods = ["POST", "GET", "OPTIONS"]
    allow_headers = ["content-type"]
    max_age = 300
  }
}

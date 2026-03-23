resource "aws_apigatewayv2_api" "search_api" {
  name          = "search-api"
  protocol_type = "HTTP"
}

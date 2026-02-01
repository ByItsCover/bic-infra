resource "aws_apigatewayv2_api" "embed_api" {
  name          = "embed-api"
  protocol_type = "HTTP"
}

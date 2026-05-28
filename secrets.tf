# HardCover

resource "aws_secretsmanager_secret" "hardcover_key" {
  name = var.hardcover_key_name
}

resource "aws_secretsmanager_secret_version" "hardcover_key" {
  secret_id     = aws_secretsmanager_secret.hardcover_key.id
  secret_string = var.hardcover_api_key
}

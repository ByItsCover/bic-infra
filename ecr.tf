data "aws_ecr_lifecycle_policy_document" "expiry_policy" {
  rule {
    priority    = 2
    description = "Keeping last 10 images"

    selection {
      tag_status   = "any"
      count_type   = "imageCountMoreThan"
      count_number = 10
    }
  }

  rule {
    priority    = 1
    description = "Expiring images older than 2 weeks"

    selection {
      tag_status   = "untagged"
      count_type   = "sinceImagePushed"
      count_unit   = "days"
      count_number = 14

    }
  }
}

# Embed Server

resource "aws_ecr_repository" "embed_server" {
  name                 = "embed-server"
  image_tag_mutability = "IMMUTABLE_WITH_EXCLUSION"

  image_tag_mutability_exclusion_filter {
    filter      = "latest*"
    filter_type = "WILDCARD"
  }

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "embed_server_policy" {
  repository = aws_ecr_repository.embed_server.name

  policy = data.aws_ecr_lifecycle_policy_document.expiry_policy.json
}

# Listopia Parser

resource "aws_ecr_repository" "listopia_parser" {
  name                 = "listopia-parser"
  image_tag_mutability = "IMMUTABLE_WITH_EXCLUSION"

  image_tag_mutability_exclusion_filter {
    filter      = "latest*"
    filter_type = "WILDCARD"
  }

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "listopia_parser_policy" {
  repository = aws_ecr_repository.listopia_parser.name

  policy = data.aws_ecr_lifecycle_policy_document.expiry_policy.json
}

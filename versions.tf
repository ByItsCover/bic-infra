terraform {
  cloud {
    organization = "ByItsCover"

    workspaces {
      project = "ByItsCover_PROD"
      name    = "bic-infra-prod"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}

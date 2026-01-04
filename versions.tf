terraform {
  # cloud {
  #   organization = "ByItsCover"

  #   workspaces {
  #     project = ""
  #     name    = ""
  #   }
  # }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "ByItsCover"

    workspaces {
      prefix = "bic-infra-"
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

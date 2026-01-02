terraform {
  cloud {
    organization = "ByItsCover"

    workspaces {
      project = "by-its-cover-dev"
      name    = "By Its Cover Dev"
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

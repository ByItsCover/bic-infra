terraform {
  cloud {
    organization = "ByItsCover"

    workspaces {
      project = ""
      name    = ""
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

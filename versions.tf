terraform {
  cloud {
    organization = var.tfe_org_name

    workspaces {
      project = var.tfe_workspace_project
      name    = var.tfe_workspace_name
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

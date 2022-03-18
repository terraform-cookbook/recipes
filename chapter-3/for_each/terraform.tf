terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.20.0"
    }
  }

  required_version = ">= 1.0.0"
}

# see https://registry.terraform.io/providers/integrations/github/latest/docs#argument-reference
provider "github" {
  # authentication is handled via environment variables
  # see `.envrc.sample` for all required variables
}

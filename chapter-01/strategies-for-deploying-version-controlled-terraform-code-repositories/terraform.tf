#######################################################################
# title:    1.10 - Strategies for Deploying Version-Controlled Terraform Code Repositories
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/strategies-for-deploying-version-controlled-terraform-code-repositories
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/integrations/github/latest
    github = {
      source  = "integrations/github"
      version = "6.4.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}

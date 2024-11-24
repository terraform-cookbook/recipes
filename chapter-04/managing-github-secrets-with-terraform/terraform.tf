#######################################################################
# title:    4.6 - Managing GitHub Secrets with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/managing-github-secrets-with-terraform
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

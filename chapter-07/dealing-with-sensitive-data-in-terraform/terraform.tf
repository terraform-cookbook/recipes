#######################################################################
# title:    7.1 - Dealing with Sensitive Data in Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/dealing-with-sensitive-data-in-terraform
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/vault/latest
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.0.0, < 5.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}

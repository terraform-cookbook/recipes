#######################################################################
# title:    7.9 - Dynamic Secrets with HashiCorp Vault
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/dynamic-secrets-with-hashicorp-vault
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/vault/latest
    vault = {
      source  = "hashicorp/vault"
      version = ">= 5.70.0, < 6.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}
#######################################################################
# title:    7.9 - Dynamic Secrets with HashiCorp Vault
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/dynamic-secrets-with-hashicorp-vault
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs#configuring-and-populating-vault
provider "vault" {
  address = "https://vault.example.com"
}

#######################################################################
# title:    7.2 - Retrieving Key-Values from HashiCorp Vault
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/retrieving-key-values-from-hashicorp-vault
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs#configuring-and-populating-vault
provider "vault" {
  address = "https://vault.example.com"
}

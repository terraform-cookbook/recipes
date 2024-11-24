#######################################################################
# title:    7.6 - Auditing and Rotating Secrets
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/auditing-and-rotating-secrets
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs#configuring-and-populating-vault
provider "vault" {
  address = "https://vault.example.com"
}

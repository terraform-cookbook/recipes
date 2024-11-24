#######################################################################
# title:    7.2 - Retrieving Key-Values from HashiCorp Vault
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/retrieving-key-values-from-hashicorp-vault
#######################################################################

# Retrieve key-value pairs from Vault
data "vault_generic_secret" "example" {
  path = "secret/example"
}

# Use the retrieved key-value pairs in your resource configuration
resource "example_resource" "example" {

  # ... other configuration ...

  username = data.vault_generic_secret.example.data["username"]
  password = data.vault_generic_secret.example.data["password"]
}

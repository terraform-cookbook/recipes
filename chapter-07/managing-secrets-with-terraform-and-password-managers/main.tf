#######################################################################
# title:    7.7 - Managing Secrets with Terraform and Password Managers
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/managing-secrets-with-terraform-and-password-managers
#######################################################################

# Use the external data source to retrieve secrets from the password manager
data "external" "secrets" {
  program = [
    "python",
    "retrieve_secrets.py"
  ]
}

# Use the retrieved secrets in your Terraform resource configurations
resource "example_resource" "example" {
  # ... other configuration ...
  password = data.external.secrets.result.database_password
}

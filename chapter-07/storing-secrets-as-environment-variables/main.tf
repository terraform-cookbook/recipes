#######################################################################
# title:    7.5 - Storing Secrets as Environment Variables
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/storing-secrets-as-environment-variables
#######################################################################

# Use the variables in your Terraform resource configurations:
resource "example_resource" "example" {

  # ... other configuration ...

  password = var.database_password
  api_key  = var.api_key
}

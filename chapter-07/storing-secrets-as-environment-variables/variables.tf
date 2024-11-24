#######################################################################
# title:    7.5 - Storing Secrets as Environment Variables
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/storing-secrets-as-environment-variables
#######################################################################

# In your Terraform configuration files, define variables for the secrets:
variable "database_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "api_key" {
  description = "API key"
  type        = string
  sensitive   = true
}

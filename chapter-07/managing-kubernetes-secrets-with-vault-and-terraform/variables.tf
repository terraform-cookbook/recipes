#######################################################################
# title:    7.4 - Managing Kubernetes Secrets with Vault and Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/managing-kubernetes-secrets-with-vault-and-terraform
#######################################################################

# Define variables for sensitive data
variable "database_username" {
  type        = string
  description = "Database username"
  sensitive   = true
}

variable "database_password" {
  type        = string
  description = "Database password"
  sensitive   = true
}

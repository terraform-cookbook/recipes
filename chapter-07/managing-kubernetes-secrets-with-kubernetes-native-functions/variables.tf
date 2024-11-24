#######################################################################
# title:    7.3 - Managing Kubernetes Secrets with Kubernetes-Native Functions
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/managing-kubernetes-secrets-with-kubernetes-native-functions
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

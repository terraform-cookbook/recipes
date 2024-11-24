#######################################################################
# title:    7.1 - Dealing with Sensitive Data in Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/dealing-with-sensitive-data-in-terraform
#######################################################################

# Define a variable for the sensitive data
variable "db_password" {
  type        = string
  description = "Database password"
  sensitive   = true
}

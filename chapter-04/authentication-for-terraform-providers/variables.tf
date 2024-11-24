#######################################################################
# title:    4.3 - Authentication for Terraform Providers
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/authentication-for-terraform-providers
#######################################################################

variable "aws_access_key" {
  description = "Access key for AWS provider"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "Secret key for AWS provider"
  type        = string
  sensitive   = true
}

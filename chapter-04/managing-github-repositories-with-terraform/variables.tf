#######################################################################
# title:    4.7 - Managing GitHub Repositories with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/managing-github-repositories-with-terraform
#######################################################################

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "GitHub owner (username or organization)"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository name"
  type        = string
}

variable "my_secret" {
  description = "The value of the GitHub secret"
  type        = string
  sensitive   = true
}

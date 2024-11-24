#######################################################################
# title:    4.7 - Managing GitHub Repositories with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/managing-github-repositories-with-terraform
#######################################################################

# see https://registry.terraform.io/providers/integrations/github/latest/docs
provider "github" {
  # see https://registry.terraform.io/providers/integrations/github/latest/docs#authentication
  token = var.github_token # Your GitHub personal access token
  owner = var.github_owner # Your GitHub username or organization name
}

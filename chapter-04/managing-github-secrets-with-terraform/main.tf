#######################################################################
# title:    4.6 - Managing GitHub Secrets with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/managing-github-secrets-with-terraform
#######################################################################

# Define a GitHub secret
resource "github_actions_secret" "example_secret" {
  repository      = var.github_repository
  secret_name     = "MY_SECRET"
  plaintext_value = var.my_secret
}

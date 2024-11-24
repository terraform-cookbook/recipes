#######################################################################
# title:    4.7 - Managing GitHub Repositories with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/managing-github-repositories-with-terraform
#######################################################################

# Create a GitHub repository
# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "example" {
  name        = "example-repo"
  description = "Repository created and managed by Terraform"
  visibility  = "private"
  auto_init   = true

  template {
    owner      = "github"
    repository = "terraform-module-template"
  }

  topics = [
    "infrastructure-as-code",
    "terraform",
  ]

  has_issues    = true
  has_wiki      = true
  has_downloads = false

  allow_merge_commit = true
  allow_squash_merge = true
  allow_rebase_merge = false
}

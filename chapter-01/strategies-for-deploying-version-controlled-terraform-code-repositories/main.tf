#######################################################################
# title:    1.10 - Strategies for Deploying Version-Controlled Terraform Code Repositories
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/strategies-for-deploying-version-controlled-terraform-code-repositories
#######################################################################

module "vcs_repo" {
  source = "git::https://github.corp/platform/terraform-github-repos.git?ref=v1.0.0"
}

# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "terraform_repo" {
  name        = "terraform-repo"
  description = "Terraform repository for managing infrastructure"
}

# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection
resource "github_branch_protection" "main" {
  repository_id = github_repository.terraform_repo.repo_id
  pattern       = "main"

  enforce_admins = false

  required_status_checks {
    strict = true

    contexts = [
      "ci/terraform-run"
    ]
  }
}

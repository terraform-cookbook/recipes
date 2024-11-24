#######################################################################
# title:    1.10 - Strategies for Deploying Version-Controlled Terraform Code Repositories
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/strategies-for-deploying-version-controlled-terraform-code-repositories
#######################################################################

# see https://registry.terraform.io/providers/integrations/github/latest/docs
provider "github" {
  # see https://registry.terraform.io/providers/integrations/github/latest/docs#authentication
  token = "<GitHub Token>"
  owner = "<GitHub Owner (username or organization)>"
}

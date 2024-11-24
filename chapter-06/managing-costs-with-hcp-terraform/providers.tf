#######################################################################
# title:    6.8 - Managing Costs with HCP Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-06/managing-costs-with-hcp-terraform
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs
provider "tfe" {
  region = "us-west-2"
}

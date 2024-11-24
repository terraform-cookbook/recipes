#######################################################################
# title:    10.1 - Managing Multiple Environments with Terraform Workspaces
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-10/managing-multiple-environments-with-terraform-workspaces
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

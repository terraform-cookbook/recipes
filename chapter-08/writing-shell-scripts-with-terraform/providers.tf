#######################################################################
# title:    8.1 - Writing Shell Scripts with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/writing-shell-scripts-with-terraform
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

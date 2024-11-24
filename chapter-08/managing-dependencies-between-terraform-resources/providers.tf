#######################################################################
# title:    8.9 - Managing Dependencies Between Terraform Resources
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/managing-dependencies-between-terraform-resources
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

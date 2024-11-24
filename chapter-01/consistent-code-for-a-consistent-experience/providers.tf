#######################################################################
# title:    1.14 - Consistent Code for a Consistent Experience
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/consistent-code-for-a-consistent-experience
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

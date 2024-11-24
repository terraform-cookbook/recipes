#######################################################################
# title:    1.13 - Using Terraform Variables
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/using-terraform-variables
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = var.region
}

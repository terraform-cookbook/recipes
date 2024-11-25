#######################################################################
# title:    9.9 - Managing Security and Compliance with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-09/managing-security-and-compliance-with-terraform
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

#######################################################################
# title:    9.10 - Advanced Debugging Techniques in Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-09/advanced-debugging-techniques-in-terraform
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

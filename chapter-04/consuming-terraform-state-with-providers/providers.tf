#######################################################################
# title:    4.10 - Consuming Terraform State with Providers
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/consuming-terraform-state-with-providers
#######################################################################

# Configure the default AWS provider
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

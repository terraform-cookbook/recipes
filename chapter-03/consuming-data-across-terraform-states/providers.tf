#######################################################################
# title:    3.14 - Consuming Data Across Terraform States
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/consuming-data-across-terraform-states
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

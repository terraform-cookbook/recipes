#######################################################################
# title:    2.11 - Limiting Blast Radius with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/limiting-blast-radius-with-terraform
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

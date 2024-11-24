#######################################################################
# title:    7.1 - Dealing with Sensitive Data in Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/dealing-with-sensitive-data-in-terraform
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

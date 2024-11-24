#######################################################################
# title:    3.11 - Optimistically Retrieving Data Using can and try
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/optimistically-retrieving-data-using-can-and-try
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

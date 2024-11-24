#######################################################################
# title:    3.11 - Optimistically Retrieving Data Using can and try
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/optimistically-retrieving-data-using-can-and-try
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/latest
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.70.0, < 6.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}

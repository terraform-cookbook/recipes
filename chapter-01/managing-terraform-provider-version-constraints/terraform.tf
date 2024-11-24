#######################################################################
# title:    1.9 - Managing Terraform Provider Version Constraints
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/managing-terraform-provider-version-constraints
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/5.1.0
    aws = {
      source = "hashicorp/aws"

      # only version 5.1.0 of the AWS provider will be used
      version = "5.1.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}

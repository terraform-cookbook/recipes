#######################################################################
# title:    1.4 - Understanding Terraform Providers
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/understanding-terraform-providers
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

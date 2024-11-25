#######################################################################
# title:    1.14 - Consistent Code for a Consistent Experience
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/consistent-code-for-a-consistent-experience
#######################################################################

terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "terraform-cookbook"

    workspaces {
      name = "<your-workspace-name>"
    }
  }

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

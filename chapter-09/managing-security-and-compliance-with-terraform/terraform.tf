#######################################################################
# title:    9.9 - Managing Security and Compliance with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-09/managing-security-and-compliance-with-terraform
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-cloud
  cloud {
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

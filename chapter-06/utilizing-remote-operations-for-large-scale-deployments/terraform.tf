#######################################################################
# title:    6.9 - Utilizing Remote Operations for Large-Scale Deployments
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-06/utilizing-remote-operations-for-large-scale-deployments
#######################################################################

terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "terraform-cookbook"

    workspaces {
      name = "large-scale-deployment"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/latest
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.70.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/tfe/latest
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.60.0, < 1.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}

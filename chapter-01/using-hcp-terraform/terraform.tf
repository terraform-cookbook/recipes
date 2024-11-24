#######################################################################
# title:    1.7 - Using HashiCorp Cloud Platform Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/using-hcp-terraform
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-cloud
  cloud {
    organization = "terraform-cookbook"

    workspaces {
      name = "<your-workspace-name>"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}

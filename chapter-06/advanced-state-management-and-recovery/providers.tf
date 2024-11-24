#######################################################################
# title:    6.10 - Advanced State Management and Recovery
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-06/advanced-state-management-and-recovery
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs
provider "tfe" {
  region = "us-west-2"
}

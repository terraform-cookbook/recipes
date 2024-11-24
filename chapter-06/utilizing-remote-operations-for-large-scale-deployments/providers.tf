#######################################################################
# title:    6.9 - Utilizing Remote Operations for Large-Scale Deployments
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-06/utilizing-remote-operations-for-large-scale-deployments
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs
provider "tfe" {
  region = "us-west-2"
}

#######################################################################
# title:    4.11 - Using Multiple, Identical Providers
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/using-multiple-identical-providers
#######################################################################

# Configure the default AWS provider
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

# Configure an additional AWS provider for the US East region
provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

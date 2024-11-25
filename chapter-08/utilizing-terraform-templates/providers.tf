#######################################################################
# title:    8.8 - Utilizing Terraform Templates
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/utilizing-terraform-templates
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

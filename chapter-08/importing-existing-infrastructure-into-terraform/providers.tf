#######################################################################
# title:    8.6 - Importing Existing Infrastructure into Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/importing-existing-infrastructure-into-terraform
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

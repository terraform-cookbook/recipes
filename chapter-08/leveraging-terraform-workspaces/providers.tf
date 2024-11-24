#######################################################################
# title:    8.7 - Leveraging Terraform Workspaces
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/leveraging-terraform-workspaces
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

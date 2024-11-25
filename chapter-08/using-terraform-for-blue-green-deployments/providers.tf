#######################################################################
# title:    8.10 - Using Terraform for Blue-Green Deployments
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/using-terraform-for-blue-green-deployments
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

#######################################################################
# title:    1.5 - Understanding Terraform Modules
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/understanding-terraform-modules
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}
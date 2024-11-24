#######################################################################
# title:    9.8 - Integrating Terraform with Monitoring Tools
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-09/integrating-terraform-with-monitoring-tools
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

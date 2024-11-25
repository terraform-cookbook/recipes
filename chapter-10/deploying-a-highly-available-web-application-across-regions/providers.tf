#######################################################################
# title:    10.2 - Deploying a Highly Available Web Application Across Regions
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-10/deploying-a-highly-available-web-application-across-regions
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}

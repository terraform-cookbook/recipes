#######################################################################
# title:    4.4 - Authentication for Private Modules
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/authentication-for-private-modules
#######################################################################

# Use a private module from HCP Terraform
# Replace 'my-org' with your organization name
# Replace 'my-module' with your module name
module "my_module" {
  source  = "app.terraform.io/my-org/my-module"
  version = "1.0.0"
}

# Example usage of a private VPC module
module "vpc" {
  source  = "app.terraform.io/my-company/vpc/aws"
  version = "1.0.0"

  vpc_cidr = "10.0.0.0/16"

  azs = [
    "us-west-2a",
    "us-west-2b",
    "us-west-2c"
  ]
}

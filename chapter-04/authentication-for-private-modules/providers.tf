#######################################################################
# title:    4.4 - Authentication for Private Modules
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/authentication-for-private-modules
#######################################################################

provider "aws" {
  region     = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# uncomment this example for file-based authentication
# provider "aws" {
#   region                   = "us-west-2"
#   shared_credentials_file  = "~/.aws/credentials"
#   profile                  = "dev"
# }

#######################################################################
# title:    4.10 - Consuming Terraform State with Providers
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/consuming-terraform-state-with-providers
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/backend/s3
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "network/terraform.tfstate"
    region = "us-west-2"
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/latest
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.70.0, < 6.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}

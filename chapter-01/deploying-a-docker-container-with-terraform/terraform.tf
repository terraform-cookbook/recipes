#######################################################################
# title:    1.11 - Deploying a Docker Container with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/deploying-a-docker-container-with-terraform
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}

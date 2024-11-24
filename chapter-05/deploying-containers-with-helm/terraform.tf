#######################################################################
# title:    5.10 - Deploying Containers with Helm
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/deploying-containers-with-helm
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/helm/latest
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.16.0, < 3.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}

#######################################################################
# title:    5.11 - Enabling Monitoring for Kubernetes Deployments Using Helm
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/enabling-monitoring-for-kubernetes-deployments-using-helm
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

#######################################################################
# title:    5.11 - Enabling Monitoring for Kubernetes Deployments Using Helm
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/enabling-monitoring-for-kubernetes-deployments-using-helm
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/helm/latest/docs
provider "helm" {
  // Configure your Helm provider

  kubernetes {
    // Configure your Kubernetes provider
  }
}

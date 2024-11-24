#######################################################################
# title:    5.10 - Deploying Containers with Helm
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/deploying-containers-with-helm
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/helm/latest/docs
provider "helm" {
  // Configure your Helm provider

  kubernetes {
    // Configure your Kubernetes provider
  }
}

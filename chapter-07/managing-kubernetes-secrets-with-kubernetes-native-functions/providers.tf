#######################################################################
# title:    7.3 - Managing Kubernetes Secrets with Kubernetes-Native Functions
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/managing-kubernetes-secrets-with-kubernetes-native-functions
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
provider "kubernetes" {
  config_path = "~/.kube/config"
}

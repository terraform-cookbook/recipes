#######################################################################
# title:    7.4 - Managing Kubernetes Secrets with Vault and Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/managing-kubernetes-secrets-with-vault-and-terraform
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/helm/latest/docs
provider "helm" {
  // Configure your Helm provider

  kubernetes {
    config_path = "~/.kube/config"
  }
}

# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs#configuring-and-populating-vault
provider "vault" {
  address = "https://vault.example.com"
}

#######################################################################
# title:    5.5 - Scheduling Containers on Kubernetes with HCL
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/scheduling-containers-on-kubernetes-with-hcl
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/kubernetes/latest
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.30.0, < 3.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}

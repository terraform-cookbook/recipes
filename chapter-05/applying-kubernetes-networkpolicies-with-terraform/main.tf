#######################################################################
# title:    5.9 - Applying Kubernetes NetworkPolicies with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/applying-kubernetes-networkpolicies-with-terraform
#######################################################################

resource "helm_release" "example" {
  name       = "my-redis-release"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
  version    = "20.3.0"

  set {
    name  = "architecture"
    value = "standalone"
  }

  set {
    name  = "auth.enabled"
    value = "false"
  }
}

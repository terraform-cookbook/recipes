#######################################################################
# title:    5.4 - Scheduling Containers on Kubernetes with YAML
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/scheduling-containers-on-kubernetes-with-yaml
#######################################################################

resource "kubernetes_manifest" "example" {
  provider = kubernetes

  manifest = yamldecode(file("${path.module}/deployment.yaml"))
}

#######################################################################
# title:    5.7 - Adjusting Annotations for Kubernetes Deployments
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/adjusting-annotations-for-kubernetes-deployments
#######################################################################

resource "kubernetes_deployment" "example" {
  metadata {
    name = "my-app"

    annotations = {
      "example.com/my-annotation" = "my-value"
    }
  }

  spec {
    // Deployment spec
  }
}

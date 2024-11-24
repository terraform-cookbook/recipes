#######################################################################
# title:    5.8 - Adjusting Configuration for Kubernetes Deployments
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/adjusting-configuration-for-kubernetes-deployments
#######################################################################

resource "kubernetes_deployment" "example" {
  metadata {
    name = "my-app"
  }

  spec {
    replicas = var.replica_count

    selector {
      match_labels = {
        app = "my-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-app"
        }
      }

      spec {
        container {
          name  = "my-app"
          image = "my-image:${var.image_version}"

          env {
            name  = "ENV_VAR_NAME"
            value = "new-value"
          }

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

#######################################################################
# title:    5.5 - Scheduling Containers on Kubernetes with HCL
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/scheduling-containers-on-kubernetes-with-hcl
#######################################################################

resource "kubernetes_deployment" "example" {
  metadata {
    name = "my-app"
    labels = {
      app = "my-app"
    }
  }

  spec {
    replicas = 3

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
          image = "my-image:latest"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

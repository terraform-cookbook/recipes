#######################################################################
# title:    5.10 - Deploying Containers with Helm
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/deploying-containers-with-helm
#######################################################################

resource "kubernetes_network_policy" "example" {
  metadata {
    name      = "example"
    namespace = "default"
  }

  spec {
    pod_selector {
      match_labels = {
        "role" = "db"
      }
    }

    policy_types = [
      "Ingress",
      "Egress"
    ]
    ingress {
      from {
        pod_selector {
          match_labels = {
            "role" = "frontend"
          }
        }
      }

      ports {
        protocol = "TCP"
        port     = "6379"
      }
    }

    egress {
      to {
        pod_selector {
          match_labels = {
            "role" = "replica"
          }
        }
      }

      ports {
        protocol = "TCP"
        port     = "6379"
      }
    }
  }
}

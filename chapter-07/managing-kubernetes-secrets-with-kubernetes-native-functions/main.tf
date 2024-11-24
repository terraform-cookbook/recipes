#######################################################################
# title:    7.3 - Managing Kubernetes Secrets with Kubernetes-Native Functions
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/managing-kubernetes-secrets-with-kubernetes-native-functions
#######################################################################

# Create a Kubernetes Secret
resource "kubernetes_secret" "example_secret" {
  metadata {
    name = "example-secret"
  }

  data = {
    username = var.database_username
    password = var.database_password
  }
}

# Use the Kubernetes Secret in a Pod configuration
resource "kubernetes_pod" "example_pod" {
  metadata {
    name = "example-pod"
  }

  spec {
    container {
      name  = "example-container"
      image = "example-image"

      env {
        name = "DATABASE_USERNAME"
        value_from {
          secret_key_ref {
            name = kubernetes_secret.example_secret.metadata[0].name
            key  = "username"
          }
        }
      }

      env {
        name = "DATABASE_PASSWORD"
        value_from {
          secret_key_ref {
            name = kubernetes_secret.example_secret.metadata[0].name
            key  = "password"
          }
        }
      }
    }
  }
}

#######################################################################
# title:    7.4 - Managing Kubernetes Secrets with Vault and Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/managing-kubernetes-secrets-with-vault-and-terraform
#######################################################################

# Enable Kubernetes auth method in Vault
resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

# Configure Kubernetes auth method
resource "vault_kubernetes_auth_backend_config" "config" {
  backend            = vault_auth_backend.kubernetes.path
  kubernetes_host    = "https://kubernetes.default.svc"
  kubernetes_ca_cert = file("/var/run/secrets/kubernetes.io/serviceaccount/ca.crt")
}

# Create a Vault policy for accessing secrets
resource "vault_policy" "example_policy" {
  name = "example-policy"

  policy = <<EOT
path "secret/data/example/*" {
  capabilities = ["read"]
}
EOT
}

# Create a Kubernetes service account
resource "kubernetes_service_account" "vault_auth" {
  metadata {
    name = "vault-auth"
  }
}

# Create a Kubernetes secret for the Vault token
resource "kubernetes_secret" "vault_token" {
  metadata {
    name = "vault-token"
  }

  data = {
    token = vault_token.example.client_token
  }
}

# Create a Vault token for Kubernetes auth
resource "vault_token" "example" {
  policies = [vault_policy.example_policy.name]

  renewable = true
  ttl       = "24h"
}

# Install Vault Secrets Operator
resource "helm_release" "vault_secrets_operator" {
  name       = "vault-secrets-operator"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault-secrets-operator"
  namespace  = "vault-secrets-operator"

  set {
    name  = "vault.address"
    value = "https://vault.example.com"
  }
}

# Create a VaultStaticSecret resource
resource "kubernetes_manifest" "example_secret" {
  manifest = {
    apiVersion = "secrets.hashicorp.com/v1beta1"
    kind       = "VaultStaticSecret"
    metadata = {
      name = "example-secret"
    }
    spec = {
      vaultAuth = {
        kubernetes = {
          role           = "example-role"
          serviceAccount = kubernetes_service_account.vault_auth.metadata[0].name
        }
      }
      mount = "secret"
      type  = "kv-v2"
      path  = "example/mysecret"
      destination = {
        create = true
        name   = "example-k8s-secret"
      }
      refreshAfter = "1h"
    }
  }
}

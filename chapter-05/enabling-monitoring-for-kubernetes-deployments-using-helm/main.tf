#######################################################################
# title:    5.11 - Enabling Monitoring for Kubernetes Deployments Using Helm
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/enabling-monitoring-for-kubernetes-deployments-using-helm
#######################################################################

resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "25.30.1" // Specify the desired version

  set {
    name  = "server.persistentVolume.enabled"
    value = "false" // Disable persistence for simplicity
  }
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "8.6.0" // Specify the desired version

  set {
    name  = "adminPassword"
    value = "securepassword" // Replace with a secure password
  }

  set {
    name  = "datasources.datasources\\.yaml.apiVersion"
    value = "1"
  }

  set {
    name  = "datasources.datasources\\.yaml.datasources[0].name"
    value = "Prometheus"
  }

  set {
    name  = "datasources.datasources\\.yaml.datasources[0].type"
    value = "prometheus"
  }

  set {
    name  = "datasources.datasources\\.yaml.datasources[0].url"
    value = "http://prometheus-server"
  }

  set {
    name  = "datasources.datasources\\.yaml.datasources[0].access"
    value = "proxy"
  }
}

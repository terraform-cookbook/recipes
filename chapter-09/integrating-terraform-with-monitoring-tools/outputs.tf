#######################################################################
# title:    9.8 - Integrating Terraform with Monitoring Tools
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-09/integrating-terraform-with-monitoring-tools
#######################################################################

output "prometheus_endpoint" {
  value = aws_prometheus_workspace.main.prometheus_endpoint
}

output "grafana_endpoint" {
  value = aws_grafana_workspace.main.endpoint
}

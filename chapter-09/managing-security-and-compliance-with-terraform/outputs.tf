#######################################################################
# title:    9.9 - Managing Security and Compliance with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-09/managing-security-and-compliance-with-terraform
#######################################################################

output "prometheus_endpoint" {
  value = aws_prometheus_workspace.main.prometheus_endpoint
}

output "grafana_endpoint" {
  value = aws_grafana_workspace.main.endpoint
}

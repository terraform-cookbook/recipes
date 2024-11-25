#######################################################################
# title:    9.8 - Integrating Terraform with Monitoring Tools
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-09/integrating-terraform-with-monitoring-tools
#######################################################################

resource "aws_prometheus_workspace" "main" {
  alias = "my-prometheus-workspace"
}

# Set up Amazon Managed Grafana
resource "aws_grafana_workspace" "main" {
  account_access_type      = "CURRENT_ACCOUNT"
  authentication_providers = ["AWS_SSO"]
  permission_type          = "SERVICE_MANAGED"
  role_arn                 = aws_iam_role.grafana.arn
}

# IAM role for Grafana
resource "aws_iam_role" "grafana" {
  name = "managed-grafana-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "grafana.amazonaws.com"
        }
      }
    ]
  })
}

# Policy to allow Grafana to access AMP
resource "aws_iam_role_policy" "grafana_amp_access" {
  name = "grafana-amp-access"
  role = aws_iam_role.grafana.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "aps:QueryMetrics",
          "aps:GetLabels",
          "aps:GetSeries",
          "aps:GetMetricMetadata"
        ]
        Resource = aws_prometheus_workspace.main.arn
      }
    ]
  })
}

# VPC Endpoint for AMP (assuming you're using a VPC)
resource "aws_vpc_endpoint" "amp" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.region}.aps-workspaces"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.private_subnet_ids
  security_group_ids = [aws_security_group.amp_endpoint.id]
}

# Security group for AMP VPC Endpoint
resource "aws_security_group" "amp_endpoint" {
  name        = "amp-endpoint-sg"
  description = "Security group for AMP VPC Endpoint"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
}

# Grafana-AMP Integration
resource "aws_grafana_workspace_api_key" "main" {
  key_name        = "amp-integration"
  key_role        = "VIEWER"
  seconds_to_live = 3600
  workspace_id    = aws_grafana_workspace.main.id
}

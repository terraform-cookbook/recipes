#######################################################################
# title:    7.8 - Compliance and Governance with Terraform Secrets
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/compliance-and-governance-with-terraform-secrets
#######################################################################

# Use a compliant secrets management system (e.g., AWS Secrets Manager)
data "aws_secretsmanager_secret_version" "example" {
  secret_id = "example-secret"
}

# Implement access controls
resource "aws_iam_policy" "secret_access_policy" {
  name        = "secret-access-policy"
  description = "Policy for accessing secrets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = data.aws_secretsmanager_secret_version.example.arn
      }
    ]
  })
}

# Use the secret in your resource configuration
resource "example_resource" "example" {
  # ... other configuration ...
  sensitive_data = jsondecode(data.aws_secretsmanager_secret_version.example.secret_string)["key"]
}

# Enable logging and monitoring (example using CloudWatch)
resource "aws_cloudwatch_log_group" "secret_access_logs" {
  name              = "secret-access-logs"
  retention_in_days = 90
}

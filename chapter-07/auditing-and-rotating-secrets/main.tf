#######################################################################
# title:    7.6 - Auditing and Rotating Secrets
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/auditing-and-rotating-secrets
#######################################################################

# Configure secret rotation policy (example using AWS Secrets Manager)
resource "aws_secretsmanager_secret_rotation" "example" {
  secret_id           = aws_secretsmanager_secret.example.id
  rotation_lambda_arn = aws_lambda_function.rotation_lambda.arn

  rotation_rules {
    automatically_after_days = 30
  }
}

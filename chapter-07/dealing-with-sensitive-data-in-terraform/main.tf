#######################################################################
# title:    7.1 - Dealing with Sensitive Data in Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/dealing-with-sensitive-data-in-terraform
#######################################################################

# Retrieve the secret from AWS Secrets Manager
data "aws_secretsmanager_secret" "db_password" {
  name = "prod/db/password"
}

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = data.aws_secretsmanager_secret.db_password.id
}

# Use the retrieved secret in your resource configuration
resource "aws_db_instance" "example" {

  # other configuration goes here

  password = jsondecode(data.aws_secretsmanager_secret_version.db_password.secret_string)["password"]
}

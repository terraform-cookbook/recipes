#######################################################################
# title:    7.10 - Securing Secret Injection in CI/CD Pipelines
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/securing-secret-injection-in-ci-cd-pipelines
#######################################################################

resource "example_resource" "example" {
  # ... other configuration ...
  password = var.database_password
  api_key  = var.api_key
}

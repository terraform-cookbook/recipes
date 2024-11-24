#######################################################################
# title:    7.10 - Securing Secret Injection in CI/CD Pipelines
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/securing-secret-injection-in-ci-cd-pipelines
#######################################################################

variable "database_password" {
  type      = string
  sensitive = true
}

variable "api_key" {
  type      = string
  sensitive = true
}

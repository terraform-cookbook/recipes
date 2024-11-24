#######################################################################
# title:    4.7 - Managing GitHub Repositories with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/managing-github-repositories-with-terraform
#######################################################################

output "repository_url" {
  value       = github_repository.example.html_url
  description = "URL of the created repository"
}

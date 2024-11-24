#######################################################################
# title:    7.1 - Dealing with Sensitive Data in Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/dealing-with-sensitive-data-in-terraform
#######################################################################

# Output the DB endpoint (non-sensitive data)
output "db_endpoint" {
  value = aws_db_instance.example.endpoint
}

#######################################################################
# title:    3.8 - Interacting with the Local Filesystem
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/interacting-with-the-local-filesystem
#######################################################################

output "file_content" {
  value = local.file_content
}

# advanced example output
output "configurations" {
  value = local.config_contents
}

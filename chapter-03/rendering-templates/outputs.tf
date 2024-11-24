#######################################################################
# title:    3.9 - Rendering Templates
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/rendering-templates
#######################################################################

output "rendered_script" {
  description = "Rendered bash script"
  value       = data.template_file.bash_script.rendered
}

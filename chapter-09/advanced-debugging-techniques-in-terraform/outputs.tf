#######################################################################
# title:    9.10 - Advanced Debugging Techniques in Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-09/advanced-debugging-techniques-in-terraform
#######################################################################

output "instance_id" {
  value = aws_instance.example.id
}

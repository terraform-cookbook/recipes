#######################################################################
# title:    4.5 - Creating a Terraform Module
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/creating-a-terraform-module
#######################################################################

output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.example.public_ip
}

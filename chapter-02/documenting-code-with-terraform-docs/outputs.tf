#######################################################################
# title:    2.7 - Documenting Code with terraform-docs
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/documenting-code-with-terraform-docs
#######################################################################

output "instance_public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the EC2 instance."
}

#######################################################################
# title:    4.5 - Creating a Terraform Module
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/creating-a-terraform-module
#######################################################################

output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "instance_public_ip" {
  value = module.ec2_instance.instance_public_ip
}

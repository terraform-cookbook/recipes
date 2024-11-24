#######################################################################
# title:    4.5 - Creating a Terraform Module
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/creating-a-terraform-module
#######################################################################

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

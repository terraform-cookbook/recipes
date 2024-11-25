#######################################################################
# title:    4.5 - Creating a Terraform Module
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/creating-a-terraform-module
#######################################################################

module "ec2_instance" {
  source = "./my_module"

  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"
  instance_name = "my-instance"
}

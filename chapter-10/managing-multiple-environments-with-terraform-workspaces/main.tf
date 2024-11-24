#######################################################################
# title:    10.1 - Managing Multiple Environments with Terraform Workspaces
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-10/managing-multiple-environments-with-terraform-workspaces
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = var.instance_type[terraform.workspace]

  tags = {
    Name = "example-instance-${terraform.workspace}"
  }
}

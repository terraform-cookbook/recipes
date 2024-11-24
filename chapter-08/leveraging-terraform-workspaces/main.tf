#######################################################################
# title:    8.7 - Leveraging Terraform Workspaces
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/leveraging-terraform-workspaces
#######################################################################

resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"

  tags = {
    Name        = "example-instance-${terraform.workspace}"
    Environment = terraform.workspace
  }
}

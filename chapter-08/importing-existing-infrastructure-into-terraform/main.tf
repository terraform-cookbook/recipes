#######################################################################
# title:    8.6 - Importing Existing Infrastructure into Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/importing-existing-infrastructure-into-terraform
#######################################################################

resource "aws_instance" "imported" {
  # The instance ID will be filled in after import

  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami = "ami-05d38da78ce859165"

  instance_type = "t2.micro"
  tags = {
    Name = "ImportedInstance"
  }
}

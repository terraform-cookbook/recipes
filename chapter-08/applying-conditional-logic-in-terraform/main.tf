#######################################################################
# title:    8.5 - Applying Conditional Logic in Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/applying-conditional-logic-in-terraform
#######################################################################

resource "aws_instance" "example" {
  count = var.create_instance ? 1 : 0

  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}

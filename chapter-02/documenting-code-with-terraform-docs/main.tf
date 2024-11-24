#######################################################################
# title:    2.7 - Documenting Code with terraform-docs
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/documenting-code-with-terraform-docs
#######################################################################

resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }
}

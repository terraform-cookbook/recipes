#######################################################################
# title:    2.6 - Validating Code with Open Policy Agent
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/validating-code-with-open-policy-agent
#######################################################################

resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }
}

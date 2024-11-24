#######################################################################
# title:    9.10 - Advanced Debugging Techniques in Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-09/advanced-debugging-techniques-in-terraform
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"

  tags = {
    Name = "DebugExample"
  }
}

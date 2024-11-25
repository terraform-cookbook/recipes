#######################################################################
# title:    8.9 - Managing Dependencies Between Terraform Resources
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/managing-dependencies-between-terraform-resources
#######################################################################

resource "aws_security_group" "sg" {
  name = "example-sg"
}

resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    aws_security_group.sg.id
  ]

  // in rare cases, you may optionally declare `depends_on`, but usually Terraform will
  // correctly determine the dependency graph and resolve these relationships in order
  depends_on = [
    aws_security_group.sg
  ]
}

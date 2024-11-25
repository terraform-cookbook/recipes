#######################################################################
# title:    8.8 - Utilizing Terraform Templates
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/utilizing-terraform-templates
#######################################################################

locals {
  user_data = templatefile("${path.module}/user_data.tpl", {
    user_name = var.user_name
  })
}

resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"

  user_data = local.user_data
}

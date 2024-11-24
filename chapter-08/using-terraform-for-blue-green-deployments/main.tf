#######################################################################
# title:    8.10 - Using Terraform for Blue-Green Deployments
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/using-terraform-for-blue-green-deployments
#######################################################################

resource "aws_instance" "blue" {
  count = var.color == "blue" ? 2 : 0

  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"
}

resource "aws_instance" "green" {
  count = var.color == "green" ? 2 : 0

  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"
}

resource "aws_elb" "example" {
  instances = concat(aws_instance.blue.*.id, aws_instance.green.*.id)

  # other configuration...
}

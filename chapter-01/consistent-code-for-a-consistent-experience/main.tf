#######################################################################
# title:    1.14 - Consistent Code for a Consistent Experience
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/consistent-code-for-a-consistent-experience
#######################################################################

# deploy an EC2 Instance with a specific AMI
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"
}

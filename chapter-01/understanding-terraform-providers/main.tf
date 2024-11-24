#######################################################################
# title:    1.4 - Understanding Terraform Providers
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/understanding-terraform-providers
#######################################################################

# deploy an EC2 Instance with a specific AMI
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"
}

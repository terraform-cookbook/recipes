#######################################################################
# title:    1.13 - Using Terraform Variables
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/using-terraform-variables
#######################################################################

# deploy an EC2 Instance with a specific AMI
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-0657605d763ac72a8"
  instance_type = "t2.micro"
}

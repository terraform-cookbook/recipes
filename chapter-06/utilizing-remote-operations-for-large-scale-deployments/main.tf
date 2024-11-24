#######################################################################
# title:    6.9 - Utilizing Remote Operations for Large-Scale Deployments
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-06/utilizing-remote-operations-for-large-scale-deployments
#######################################################################

# Example of a large-scale deployment resource
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "Large Scale VPC"
    Environment = "Production"
  }
}

# Use of a module for standardized deployments
module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["1", "2", "3", "4", "5"])

  name = "instance-${each.key}"

  ami                    = "ami-ebd02392"
  instance_type          = "t3.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Environment = "Production"
    Terraform   = "true"
  }
}

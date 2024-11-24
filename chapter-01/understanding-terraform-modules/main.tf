#######################################################################
# title:    1.5 - Understanding Terraform Modules
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/understanding-terraform-modules
#######################################################################

# deploy a VPC
# see https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.16.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs = [
    "us-west-2a",
    "us-west-2b",
    "us-west-2c"
  ]

  private_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]

  public_subnets = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24"
  ]

  enable_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

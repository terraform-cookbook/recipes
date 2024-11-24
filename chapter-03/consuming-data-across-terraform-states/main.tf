#######################################################################
# title:    3.14 - Consuming Data Across Terraform States
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/consuming-data-across-terraform-states
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
data "aws_vpc" "existing" {
  tags = {
    Environment = "production"
  }
}

# see https://developer.hashicorp.com/terraform/language/state/remote-state-data
data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "my-terraform-state"
    key    = "network/terraform.tfstate"
    region = "us-west-2"
  }
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "example" {
  vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
  cidr_block = "10.0.1.0/24"
}

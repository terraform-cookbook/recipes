#######################################################################
# title:    4.8 - Dynamic Configuration with Consul KV
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/dynamic-configuration-with-consul-kv
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Store the VPC ID in Consul KV
# see https://registry.terraform.io/providers/hashicorp/consul/latest/docs/resources/key_prefix
resource "consul_key_prefix" "vpc" {
  path_prefix = "terraform/vpc/"

  subkeys = {
    "id" = aws_vpc.main.id
  }
}

# Retrieve the VPC ID from Consul KV
# see https://registry.terraform.io/providers/hashicorp/consul/latest/docs/data-sources/keys
data "consul_keys" "vpc" {
  key {
    name = "vpc_id"
    path = "terraform/vpc/id"
  }
}

# Use the retrieved VPC ID
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "example" {
  vpc_id     = data.consul_keys.vpc.var.vpc_id
  cidr_block = "10.0.1.0/24"
}

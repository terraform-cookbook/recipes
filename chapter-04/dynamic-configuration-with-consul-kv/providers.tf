#######################################################################
# title:    4.8 - Dynamic Configuration with Consul KV
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/dynamic-configuration-with-consul-kv
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

# see https://registry.terraform.io/providers/hashicorp/consul/latest/docs
provider "consul" {
  address = "localhost:8500"
  scheme  = "http"
}

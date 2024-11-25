#######################################################################
# title:    8.3 - Dynamic Configuration with Consul Key-Values
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/dynamic-configuration-with-consul-key-values
#######################################################################

# Configure the provider with any required settings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

# see https://registry.terraform.io/providers/hashicorp/consul/latest/docs
provider "consul" {
  address    = "localhost:8500"
  datacenter = "dc1"
  scheme     = "http"
}

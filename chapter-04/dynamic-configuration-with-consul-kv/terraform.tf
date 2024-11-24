#######################################################################
# title:    4.8 - Dynamic Configuration with Consul KV
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/dynamic-configuration-with-consul-kv
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/latest
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.70.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/consul/latest
    consul = {
      source  = "hashicorp/consul"
      version = ">= 2.20.0, < 3.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}

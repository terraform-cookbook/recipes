#######################################################################
# title:    4.9 - Service-Health-Aware Provider Configuration
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/service-health-aware-provider-configuration
#######################################################################

# Configure the AWS provider using the health check result
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region   = "us-west-2"
  endpoint = local.active_node
}

# see https://registry.terraform.io/providers/hashicorp/consul/latest/docs
provider "consul" {
  address = "localhost:8500"
  scheme  = "http"
}

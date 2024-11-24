#######################################################################
# title:    3.7 - Creating Subnets from a CIDR Block
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/creating-subnets-from-a-cidr-block
#######################################################################

locals {
  base_cidr_block = "10.0.0.0/16"

  # Create four /24 subnets
  subnets = [for i in range(4) : cidrsubnet(local.base_cidr_block, 8, i)]
}

locals {
  first_ip_in_each_subnet = [for subnet in local.subnets : cidrhost(subnet, 1)]
}

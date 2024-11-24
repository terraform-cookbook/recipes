#######################################################################
# title:    3.7 - Creating Subnets from a CIDR Block
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/creating-subnets-from-a-cidr-block
#######################################################################

output "subnet_cidr_blocks" {
  value = local.subnets
}

#######################################################################
# title:    3.14 - Consuming Data Across Terraform States
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/consuming-data-across-terraform-states
#######################################################################

output "vpc_id" {
  value = data.aws_vpc.existing.id
}

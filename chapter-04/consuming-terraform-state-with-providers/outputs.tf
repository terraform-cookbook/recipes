#######################################################################
# title:    4.10 - Consuming Terraform State with Providers
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/consuming-terraform-state-with-providers
#######################################################################

# Output demonstrating access to the remote state
output "vpc_id" {
  value = data.terraform_remote_state.network.outputs.vpc_id
}

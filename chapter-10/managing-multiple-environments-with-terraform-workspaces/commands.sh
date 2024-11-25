#######################################################################
# title:    10.1 - Managing Multiple Environments with Terraform Workspaces
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-10/managing-multiple-environments-with-terraform-workspaces
#######################################################################

# To manage multiple environments, you can create separate workspaces for each environment:
terraform workspace new dev
terraform workspace new prd

# Then, you can switch between workspaces using the `terraform workspace select` command:
terraform workspace select dev
terraform apply

$ terraform workspace select prd
$ terraform apply

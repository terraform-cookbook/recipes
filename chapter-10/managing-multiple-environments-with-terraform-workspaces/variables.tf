#######################################################################
# title:    10.1 - Managing Multiple Environments with Terraform Workspaces
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-10/managing-multiple-environments-with-terraform-workspaces
#######################################################################

variable "environment" {
  type        = string
  description = "Environment to deploy"
  default     = terraform.workspace
}

variable "instance_type" {
  type = map(string)

  description = "EC2 Instance Type"

  default = {
    default = "t2.micro"
    dev     = "t2.small"
    prod    = "t2.medium"
  }
}

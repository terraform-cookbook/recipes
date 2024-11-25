#######################################################################
# title:    8.10 - Using Terraform for Blue-Green Deployments
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/using-terraform-for-blue-green-deployments
#######################################################################

variable "color" {
  description = "Deployed environment color: blue or green"
  default     = "blue"
}

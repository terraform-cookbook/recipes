#######################################################################
# title:    1.13 - Using Terraform Variables
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/using-terraform-variables
#######################################################################

variable "region" {
  type        = string
  description = "AWS Region."
  default     = "us-west-1"
}

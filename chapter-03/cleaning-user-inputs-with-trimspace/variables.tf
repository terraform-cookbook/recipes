#######################################################################
# title:    3.1 - Cleaning User Inputs with trimpsace
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/cleaning-user-inputs-with-trimspace
#######################################################################

variable "user_input" {
  description = "The user input that needs cleaning"
  type        = string
  default     = " \nExample user input with leading and trailing spaces\n "
}

locals {
  clean_user_input = trimspace(var.user_input)
}

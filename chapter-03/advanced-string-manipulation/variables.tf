#######################################################################
# title:    3.4 - Advanced String Manipulation
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/advanced-string-manipulation
#######################################################################

variable "user_input" {
  type        = string
  description = "The user input that needs processing"
  default     = "hello, world! 123"
}

locals {
  processed_input = replace(
    replace(
      upper(var.user_input),
      "WORLD",
      "TERRAFORM"
    ),
    "!",
    "!!!"
  )
}

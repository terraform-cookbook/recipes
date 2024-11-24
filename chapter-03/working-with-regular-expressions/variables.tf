#######################################################################
# title:    3.3 - Working with Regular Expressions
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/working-with-regular-expressions
#######################################################################

variable "user_input" {
  description = "The user input that needs processing"
  type        = string
  default     = "123-45-6789"
}

locals {
  masked_input = replace(var.user_input,
    regex("\\d{3}-\\d{2}-(\\d{4})", var.user_input),
    "XXX-XX-$1"
  )
}

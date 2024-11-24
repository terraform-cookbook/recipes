#######################################################################
# title:    3.2 - Removing Prefixes and Suffixes
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/removing-prefixes-and-suffixes
#######################################################################

variable "user_input" {
  description = "The user input that needs cleaning"
  type        = string
  default     = "prefix_exampleUserInput_suffix"
}

locals {
  prefix = "prefix_"
  suffix = "_suffix"

  without_prefix   = trimprefix(var.user_input, local.prefix)
  clean_user_input = trimsuffix(local.without_prefix, local.suffix)
}

#######################################################################
# title:    3.5 - Working with Case-Sensitive Strings Using title, upper, and lower
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/working-with-case-sensitive-strings-using-title-upper-and-lower
#######################################################################

variable "input_string" {
  description = "The string to be case-transformed"
  type        = string
  default     = "hello, WORLD! This is TerraForm."
}

locals {
  title_case = title(var.input_string)
  upper_case = upper(var.input_string)
  lower_case = lower(var.input_string)
}

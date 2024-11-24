#######################################################################
# title:    3.5 - Working with Case-Sensitive Strings Using title, upper, and lower
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/working-with-case-sensitive-strings-using-title-upper-and-lower
#######################################################################

output "case_transformations" {
  value = {
    original   = var.input_string
    title_case = local.title_case
    upper_case = local.upper_case
    lower_case = local.lower_case
  }
}

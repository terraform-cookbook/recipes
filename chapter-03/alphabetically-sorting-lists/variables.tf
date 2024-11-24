#######################################################################
# title:    3.6 - Alphabetically Sorting Lists
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/alphabetically-sorting-lists
#######################################################################

variable "unsorted_list" {
  description = "List of strings to be sorted"
  type        = list(string)
  default     = ["banana", "apple", "cherry", "date", "elderberry"]
}

locals {
  sorted_list = sort(var.unsorted_list)
}

#######################################################################
# title:    3.8 - Interacting with the Local Filesystem
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/interacting-with-the-local-filesystem
#######################################################################

variable "config_file_path" {
  description = "Path to the configuration file"
  type        = string
  default     = "config.txt"
}

locals {
  file_content = fileexists(var.config_file_path) ? file(var.config_file_path) : "Default content"
}

# advanced example
variable "config_files" {
  description = "List of configuration file paths"
  type        = list(string)

  default = [
    "config1.txt",
    "config2.txt",
    "config3.txt"
  ]
}

locals {
  config_contents = {
    for path in var.config_files :
    path => fileexists(path) ? file(path) : "File not found: ${path}"
  }
}

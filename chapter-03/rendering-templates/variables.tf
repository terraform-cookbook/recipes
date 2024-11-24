#######################################################################
# title:    3.9 - Rendering Templates
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/rendering-templates
#######################################################################

variable "user_name" {
  description = "User name for the script"
  type        = string
  default     = "Taylor"
}

# note that `template_file` has a more modern version available: `templatefile`
# see https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file
# and https://developer.hashicorp.com/terraform/language/functions/templatefile
data "template_file" "bash_script" {
  template = <<-EOF
    #!/bin/bash
    echo "Hello, ${user_name}"
  EOF

  vars = {
    user_name = var.user_name
  }
}

locals {
  bash_script = templatefile("${path.module}/template.sh", {
    user_name = var.user_name
  })
}

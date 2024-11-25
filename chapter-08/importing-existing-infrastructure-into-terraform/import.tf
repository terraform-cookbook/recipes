#######################################################################
# title:    8.6 - Importing Existing Infrastructure into Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/importing-existing-infrastructure-into-terraform
#######################################################################

import {
  to = aws_instance.imported
  id = "i-1234567890abcdef0"
}

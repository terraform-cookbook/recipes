#######################################################################
# title:    8.5 - Applying Conditional Logic in Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/applying-conditional-logic-in-terraform
#######################################################################

variable "create_instance" {
  description = "Control whether an EC2 instance should be created"
  type        = bool
  default     = false
}

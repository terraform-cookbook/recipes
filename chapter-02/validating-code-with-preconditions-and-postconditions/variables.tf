#######################################################################
# title:    2.5 - Validating Code with Preconditions and Postconditions
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/validating-code-with-preconditions-and-postconditions
#######################################################################

# Precondition: Variable validation
variable "instance_type" {
  type        = string
  description = "The instance type for the EC2 instance."

  # This default value will break validation
  default = "t3.small"

  validation {
    condition     = contains(["t2.micro", "t2.small"], var.instance_type)
    error_message = "The instance_type must be one of: t2.micro, t2.small."
  }
}

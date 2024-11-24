#######################################################################
# title:    2.7 - Documenting Code with terraform-docs
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/documenting-code-with-terraform-docs
#######################################################################

# Precondition: Variable validation
variable "instance_type" {
  type        = string
  description = "The instance type for the EC2 instance."
  default     = "t2.micro"
}

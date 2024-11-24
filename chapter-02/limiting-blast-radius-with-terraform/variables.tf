#######################################################################
# title:    2.11 - Limiting Blast Radius with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/limiting-blast-radius-with-terraform
#######################################################################

variable "enable_feature_x" {
  type        = bool
  default     = false
  description = "Whether to enable Feature X resources"
}

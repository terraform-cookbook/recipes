#######################################################################
# title:    3.10 - Validating Input Strings
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/validating-input-strings
#######################################################################

variable "environment" {
  type        = string
  description = "The deployment environment (dev, staging, or prod)"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "The environment must be dev, staging, or prod."
  }
}

variable "instance_count" {
  type        = number
  description = "Number of instances to create"

  validation {
    condition     = var.instance_count > 0 && var.instance_count <= 10
    error_message = "Instance count must be between 1 and 10."
  }
}

# advanced example with multiple validations
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "Must be a valid IPv4 CIDR block."
  }

  validation {
    condition     = split("/", var.vpc_cidr)[1] <= "24" && split("/", var.vpc_cidr)[1] >= "16"
    error_message = "VPC CIDR block must be between a /16 and /24."
  }
}

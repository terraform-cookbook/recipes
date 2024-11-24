#######################################################################
# title:    3.13 - Good Error Messages for Bad Input
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/good-error-messages-for-bad-input
#######################################################################

variable "instance_type" {
  type        = string
  description = "The EC2 instance type"

  validation {
    condition     = can(regex("^t[23]\\..*", var.instance_type))
    error_message = "Invalid instance type. Must be a t2 or t3 instance type (e.g., t2.micro, t3.small)."
  }
}

variable "environment" {
  type        = string
  description = "The deployment environment"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Invalid environment. Must be one of: dev, staging, prod."
  }
}

variable "db_settings" {
  type = object({
    instance_class = string
    storage_type   = string
    storage_size   = number
  })

  validation {
    condition     = can(regex("^db\\.[tmrc][3-6]\\..*", var.db_settings.instance_class))
    error_message = "Invalid DB instance class. Must be a valid RDS instance type (e.g., db.t3.micro, db.m5.large)."
  }
  validation {
    condition     = contains(["gp2", "io1"], var.db_settings.storage_type)
    error_message = "Invalid storage type. Must be either 'gp2' or 'io1'. For high-performance requirements, use 'io1'."
  }

  validation {
    condition     = var.db_settings.storage_size >= 20 && var.db_settings.storage_size <= 65536
    error_message = "Invalid storage size. Must be between 20 GiB and 65,536 GiB. For larger sizes, consider using a larger instance class."
  }
}

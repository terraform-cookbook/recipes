# define an input variable of type string that contains a prefix
variable "location_4" {
  type        = string
  description = "Location of Device"
  default     = "Rack 3, Position 12"
}

locals {
  # apply a Regular Expression on the `location_4` input variable
  # the expression creates two groups:
  # Group 1 searches for "Rack", followed by a space and one or more digits
  # Group 2 searches for "Position", followed by a space and one or more digits
  location_4 = regex("(Rack [0-9]+), (Position [0-9]+)", var.location_4)
}

# use an output value to display the local value of "location_4"
# this local value
output "location_4_1" {
  description = "(sanitized) Location of Device"
  value       = local.location_4
}

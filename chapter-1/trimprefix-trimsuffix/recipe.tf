# define an input variable of type string that contains a prefix
variable "unsanitized_location_3" {
  type        = string
  description = "(unsanitized) Location of Device"
  default     = "Server Rack 3, Position 12"
}

# define a local value to execute the `trimprefix` function
locals {
  # trim the prefix "Server" from the "unsanitized_location_3" input variable
  sanitized_location_3 = trimprefix(var.unsanitized_location_3, "Server")
}

# use an output value to display the local value of "sanitized_location_3"
output "sanitized_location_3_1" {
  description = "(sanitized) Location of Device"
  value       = local.sanitized_location_3
}

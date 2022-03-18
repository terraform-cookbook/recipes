# define an input variable of type string that contains trailing spaces
variable "sensitive_location" {
  type        = string
  description = "(unsanitized) Location of Device"
  default     = "Rack 3, Position 12"
}

# use an output value to replace the word "Rack" in "sensitive_location" with an empty string
output "sensitive_location" {
  description = "(sanitized) Location of Device"
  value       = replace(var.sensitive_location, "Rack ", "")
}

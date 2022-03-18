# define an input variable that contains trailing line breaks
variable "unsanitized_location_1" {
  type        = string
  description = "(unsanitized) Location of Device"
  default     = "Rack 3,\nPosition 12\n\n"
}

# use an output value to display the result of using "chomp" on the "unsanitized_location_1" input variable
output "sanitized_location_1" {
  description = "(sanitized) Location of Device"
  value       = chomp(var.unsanitized_location_1)
}

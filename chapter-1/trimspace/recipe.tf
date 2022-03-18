# define an input variable that contains trailing spaces
variable "unsanitized_location_2" {
  type        = string
  description = "(unsanitized) Location of Device"
  default     = "Rack 3, Position 12  "
}

# use an output value to display the result of using "trimspace" on the "unsanitized_location_2" input variable
output "sanitized_location_2" {
  description = "(sanitized) Location of Device"
  value       = trimspace(var.unsanitized_location_2)
}

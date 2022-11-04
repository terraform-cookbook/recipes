# define an input variable
variable "example" {
  type        = string
  description = "Location of Device"
  default     = "Rack 3, Position 12"
}

# use an output value to display the result of trying to access a non-existent attribute in example
output "fallback" {
  description = "Casting the Location of Device"
  value       = try(var.example.fake, "fallback")
}

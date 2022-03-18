# define an input variable of type string that contains varying uppercase and lowercase characters
variable "server_location" {
  type        = string
  description = "(unformatted) Location of Device"
  default     = "rack 3, Position 12"
}

# use an output value to show the source string in titlecase
output "title_location" {
  description = "(title formatted) Location of Device"
  value       = title(var.server_location)
}

# use an output value to show the source string in uppercase
output "upper_location" {
  description = "(upper formatted) Location of Device"
  value       = upper(var.server_location)
}

# use an output value to show the source string in lowercase
output "lower_location" {
  description = "(lower formatted) Location of Device"
  value       = lower(var.server_location)
}

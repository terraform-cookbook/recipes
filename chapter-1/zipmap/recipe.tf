# define an input variable that contains server IPs
variable "server_ips" {
  type        = list(string)
  description = "Example Server IPs"
  default     = ["10.0.0.1", "10.0.0.2"]
}

# define an input variable that contains server names
variable "server_names" {
  type        = list(string)
  description = "Example Server Names"
  default     = ["app-server-01", "app-server-02"]
}

# use an output value to display the result of using "zipmap" on the two input variable lists
output "zipmap" {
  description = "Zipmapped Server IPs and Names"
  value       = zipmap(var.server_ips, var.server_names)
}

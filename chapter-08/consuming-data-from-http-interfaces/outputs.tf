#######################################################################
# title:    8.4 - Consuming Data from HTTP Interfaces
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/consuming-data-from-http-interfaces
#######################################################################

output "ip_info_content_type" {
  value = data.http.ip_info.response_headers["Content-Type"]
}

output "ip_info_body" {
  value = jsondecode(data.http.ip_info.response_body)
}

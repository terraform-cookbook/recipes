#######################################################################
# title:    8.4 - Consuming Data from HTTP Interfaces
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/consuming-data-from-http-interfaces
#######################################################################

data "http" "ip_info" {
  url = "http://ipinfo.io/json"
}

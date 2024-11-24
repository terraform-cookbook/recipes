#######################################################################
# title:    4.9 - Service-Health-Aware Provider Configuration
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/service-health-aware-provider-configuration
#######################################################################

# Data source to check service health via Consul HTTP API
data "http" "service_health_check" {
  url = "http://localhost:8500/v1/health/service/my-service"
}

# Local values to process the health check response
locals {
  service_health = jsondecode(data.http.service_health_check.body)[0]
  active_node    = local.service_health.Status == "passing" ? local.service_health.Service.Address : "fallback_address"
}

# deploy an EC2 Instance with a specific AMI
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"
}

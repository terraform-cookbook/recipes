#######################################################################
# title:    10.2 - Deploying a Highly Available Web Application Across Regions
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-10/deploying-a-highly-available-web-application-across-regions
#######################################################################

variable "environment" {
  type        = string
  description = "Environment to deploy"
  default     = terraform.workspace
}

variable "instance_type" {
  type = map(string)

  description = "EC2 Instance Type"

  default = {
    default = "t2.micro"
    dev     = "t2.small"
    prod    = "t2.medium"
  }
}

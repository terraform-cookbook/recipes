#######################################################################
# title:    5.10 - Deploying Containers with Helm
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/deploying-containers-with-helm
#######################################################################

variable "replica_count" {
  description = "Number of replicas for the deployment"
  type        = number
  default     = 5
}

variable "image_version" {
  description = "Version of the image to use"
  type        = string
  default     = "v2"
}

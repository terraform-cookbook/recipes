#######################################################################
# title:    5.8 - Adjusting Configuration for Kubernetes Deployments
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/adjusting-configuration-for-kubernetes-deployments
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

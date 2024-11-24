#######################################################################
# title:    5.11 - Enabling Monitoring for Kubernetes Deployments Using Helm
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/enabling-monitoring-for-kubernetes-deployments-using-helm
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

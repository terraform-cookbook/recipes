#######################################################################
# title:    5.9 - Applying Kubernetes NetworkPolicies with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/applying-kubernetes-networkpolicies-with-terraform
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

#######################################################################
# title:    4.1 - Using Public Modules to Create an EKS Cluster
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/using-public-modules-to-create-an-eks-cluster
#######################################################################

variable "cluster_version" {
  type        = string
  description = "The Kubernetes version for our clusters"
  default     = "1.30"
}

variable "cluster_instance_type" {
  type        = string
  description = "EC2 instance type for the EKS autoscaling group."
  default     = "m5.large"
}

variable "cluster_asg_desired_capacity" {
  type        = number
  description = "The default number of EC2 instances our EKS cluster runs."
  default     = 3
}

variable "cluster_asg_max_size" {
  type        = number
  description = "The maximum number of EC2 instances our EKS cluster will have."
  default     = 5
}

variable "cluster_enabled_log_types" {
  type        = list(string)
  description = "The log types that will be enabled for the EKS cluster."
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "cluster_write_kubeconfig" {
  type        = bool
  description = "Toggle to output a Kubernetes configuration file. "
  default     = false
}

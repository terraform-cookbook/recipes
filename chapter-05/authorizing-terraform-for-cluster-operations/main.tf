#######################################################################
# title:    5.3 - Authorizing Terraform for Cluster Operations
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/authorizing-terraform-for-cluster-operations
#######################################################################

data "aws_eks_cluster" "cluster" {
  name = "<CLUSTER_NAME>"
}

data "aws_eks_cluster_auth" "cluster" {
  name = "<CLUSTER_NAME>"
}

#######################################################################
# title:    4.1 - Using Public Modules to Create an EKS Cluster
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/using-public-modules-to-create-an-eks-cluster
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.ca.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

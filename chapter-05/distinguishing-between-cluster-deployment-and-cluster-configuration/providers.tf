#######################################################################
# title:    5.2 - Distinguishing Between Cluster Deployment and Cluster Configuration
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/distinguishing-between-cluster-deployment-and-cluster-configuration
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_ca_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

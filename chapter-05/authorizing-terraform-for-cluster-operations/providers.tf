#######################################################################
# title:    5.3 - Authorizing Terraform for Cluster Operations
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/authorizing-terraform-for-cluster-operations
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
provider "aws" {
  region = "us-west-2"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.ca.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
}

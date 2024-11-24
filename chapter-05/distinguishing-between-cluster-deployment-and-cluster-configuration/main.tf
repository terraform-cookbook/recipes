#######################################################################
# title:    5.2 - Distinguishing Between Cluster Deployment and Cluster Configuration
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/distinguishing-between-cluster-deployment-and-cluster-configuration
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key
resource "aws_kms_key" "eks" {
  description             = "EKS Secret Encryption Key"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.24.0"

  cluster_name    = "my-cluster"
  cluster_version = "1.30"

  subnets = [
    "<SUBNET_ID_1>",
    "<SUBNET_ID_2>",
    "<SUBNET_ID_3>"
  ]

  node_groups = {
    eks_nodes = {
      desired_capacity = 3
      max_capacity     = 10
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }

  vpc_id = "<VPC_ID>"
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "my-namespace"
  }
}

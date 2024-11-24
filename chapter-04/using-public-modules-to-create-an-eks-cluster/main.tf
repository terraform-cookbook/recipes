#######################################################################
# title:    4.1 - Using Public Modules to Create an EKS Cluster
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/using-public-modules-to-create-an-eks-cluster
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

  cluster_name    = var.project_name
  cluster_version = var.cluster_version
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  cluster_enabled_log_types = var.cluster_enabled_log_types
  write_kubeconfig          = var.cluster_write_kubeconfig

  cluster_encryption_config = [
    {
      provider_key_arn = aws_kms_key.eks.arn
      resources        = ["secrets"]
    }
  ]

  worker_groups = [
    {
      asg_desired_capacity = var.cluster_asg_desired_capacity
      asg_max_size         = var.cluster_asg_max_size
      instance_type        = var.cluster_instance_type
    }
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

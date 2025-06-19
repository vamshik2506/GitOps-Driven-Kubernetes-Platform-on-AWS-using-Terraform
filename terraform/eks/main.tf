module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = var.subnets
  vpc_id          = var.vpc_id

  iam_role_arn          = var.iam_role_arn
  authentication_mode   = "API"
  

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
      iam_role_arn   = var.iam_role_arn
    }
  }

  tags = {
    Environment = "dev"
    Project     = var.project
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = var.subnets
  vpc_id          = var.vpc_id

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  authentication_mode = "API"
  iam_role_arn        = var.iam_role_arn

  # ✅ Enable Terraform management of aws-auth ConfigMap
  manage_aws_auth_configmap = true

  # ✅ Automatically map GitHub Actions user to system:masters
  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::044854092841:user/krishna"
      username = "krishna"
      groups   = ["system:masters"]
    }
  ]

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
      iam_role_arn   = var.iam_role_arn
      security_groups = [aws_security_group.eks_node_sg.id]
    }
  }

  tags = {
    Environment = "dev"
    Project     = var.project
  }
}

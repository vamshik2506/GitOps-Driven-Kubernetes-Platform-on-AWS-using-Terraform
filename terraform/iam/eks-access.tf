provider "aws" {
  region = "ap-south-1"
}
locals {
  user_arn = "arn:aws:iam::044854092841:user/krishna"
}

resource "aws_eks_access_entry" "eks_user_access" {
  cluster_name  = var.cluster_name
  principal_arn = local.user_arn
  type          = "STANDARD"
  user_name     = "krishna"
}

resource "aws_eks_access_policy_association" "admin_access" {
  cluster_name  = var.cluster_name
  principal_arn = local.user_arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }

  depends_on = [aws_eks_access_entry.eks_user_access]
}

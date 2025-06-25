resource "aws_eks_access_entry" "eks_user_access" {
  cluster_name  = module.eks.cluster_name
  principal_arn = "arn:aws:iam::044854092841:user/krishna"
}

resource "aws_eks_access_policy_association" "admin_access" {
  cluster_name  = module.eks.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = "arn:aws:iam::044854092841:user/krishna"

  access_scope {
    type = "cluster"
  }
}

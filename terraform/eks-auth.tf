data "aws_eks_cluster" "cluster" {
  name = "gitops-eks-cluster"

  depends_on = [
    module.eks
  ]
}

data "aws_eks_cluster_auth" "cluster" {
  name = "gitops-eks-cluster"

  depends_on = [
    module.eks
  ]
}

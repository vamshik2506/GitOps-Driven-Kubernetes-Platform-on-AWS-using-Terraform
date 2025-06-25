module "vpc" {
  source         = "./vpc"
  region         = var.region
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  azs            = var.azs
  project        = var.project
  cluster_name   = var.cluster_name
}
module "iam" {
  source       = "./iam"
  cluster_name = var.cluster_name
}
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.21.0"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids = module.vpc.public_subnet_ids
  vpc_id = module.vpc.vpc_id

  manage_aws_auth_configmap = true

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::044854092841:user/krishna"
      username = "krishna"
      groups   = ["system:masters"]
    }
  ]

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      desired_capacity = 2
    }
  }
}

module "argocd" {
  source           = "./argocd"
  cluster_name     = module.eks.cluster_name
  cluster_endpoint = module.eks.cluster_endpoint
  cluster_ca       = module.eks.cluster_certificate_authority_data
}

module "monitoring" {
  source           = "./monitoring"
  cluster_name     = module.eks.cluster_name
  cluster_endpoint = module.eks.cluster_endpoint
  cluster_ca       = module.eks.cluster_certificate_authority_data
}

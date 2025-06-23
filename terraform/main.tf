module "vpc" {
  source         = "./vpc"
  region         = var.region
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  azs            = var.azs
  project        = var.project
  cluster_name   = var.cluster_name
}

module "eks" {
  source          = "./eks"
  cluster_name    = var.cluster_name
  cluster_version = "1.28"
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnet_ids
  project         = var.project
  iam_role_arn    = module.iam.eks_node_role_arn
}

module "iam" {
  source       = "./iam"
  cluster_name = module.eks.cluster_name
}
module "argocd" {
  source           = "./argocd"
  cluster_name     = module.eks.cluster_name
  cluster_endpoint = module.eks.cluster_endpoint
  cluster_ca       = module.eks.cluster_certificate_authority_data
}

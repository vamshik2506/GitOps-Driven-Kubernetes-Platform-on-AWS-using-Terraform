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
  version = "20.8.4"

  cluster_name    = "gitops-eks-cluster"
  cluster_version = "1.29"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  enable_irsa = true

  authentication_mode = "API_AND_CONFIG_MAP"

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1

      iam_role_additional_policies = {
        ssm = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      }
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
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

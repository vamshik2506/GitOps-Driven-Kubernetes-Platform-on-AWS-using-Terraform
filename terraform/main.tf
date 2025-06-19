module "vpc" {
  source = "./vpc"

  region         = var.region
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  azs            = var.azs
  project        = var.project
}

module "eks" {
  source          = "./eks"
  cluster_name    = var.cluster_name
  cluster_version = "1.28"
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnet_ids
  project         = var.project
}

module "iam" {
  source = "./iam"
}

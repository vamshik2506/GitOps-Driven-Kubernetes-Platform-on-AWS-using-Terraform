region         = "us-east-1"
project        = "gitops"
vpc_cidr       = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
azs            = ["us-east-1a", "us-east-1b"]
cluster_name   = "gitops-eks-cluster"

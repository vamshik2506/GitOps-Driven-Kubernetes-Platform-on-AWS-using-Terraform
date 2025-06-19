variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

variable "project" {
  description = "Project name prefix"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}
variable "cluster_name" {
  description = "Name of the EKS cluster (used for subnet tagging)"
  type        = string
}

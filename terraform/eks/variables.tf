variable "cluster_name" {}
variable "cluster_version" {}
variable "vpc_id" {}
variable "subnets" {
  type = list(string)
}
variable "project" {}
variable "iam_role_arn" {
  description = "IAM role ARN for EKS managed node group"
  type        = string
}

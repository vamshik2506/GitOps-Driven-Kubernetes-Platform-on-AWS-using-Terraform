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
variable "manage_aws_auth_configmap" {
  type    = bool
  default = false
}

variable "aws_auth_users" {
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

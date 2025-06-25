variable "region" {}
variable "project" {}
variable "vpc_cidr" {}
variable "public_subnets" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
variable "cluster_name" {}

# Optional (you can add them if you want to make things flexible)
variable "cluster_version" {
  default = "1.28"
}

variable "aws_auth_users" {
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = [
    {
      userarn  = "arn:aws:iam::044854092841:user/krishna"
      username = "krishna"
      groups   = ["system:masters"]
    }
  ]
}

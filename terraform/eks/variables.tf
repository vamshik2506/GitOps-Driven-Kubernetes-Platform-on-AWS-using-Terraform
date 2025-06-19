variable "cluster_name" {}
variable "cluster_version" {}
variable "subnets" {
  type = list(string)
}
variable "vpc_id" {}
variable "project" {}

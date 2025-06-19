variable "cluster_name" {}
variable "cluster_version" {}
variable "vpc_id" {}
variable "subnets" {
  type = list(string)
}
variable "project" {}

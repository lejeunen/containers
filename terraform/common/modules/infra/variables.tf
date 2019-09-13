variable "env" {
  type = "string"
}
variable "cluster_name" {
  type = "string"
}
# creates an explicit dependency towards module eks
variable "eks_cluster_id" {
  type = "string"
}
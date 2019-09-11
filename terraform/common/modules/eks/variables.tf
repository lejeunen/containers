variable "vpc_id" {
  type = "string"
}
variable "env" {
  type = "string"
}
variable "cluster_name" {
  type = "string"
}
variable "app_subnet_ids" {
  type = list(string)
}
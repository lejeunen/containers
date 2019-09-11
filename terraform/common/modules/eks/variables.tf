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
variable "worker_ami"{
  type = "string"
}
variable "keypair_name"{
  type = "string"
}
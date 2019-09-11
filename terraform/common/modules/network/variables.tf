variable "env" {
  type = "string"
}
variable "cluster_name" {
  type = "string"
}
variable "subnet_count" {
  type        = "string"
  description = "The number of subnets we want to create per type to ensure high availability."
}


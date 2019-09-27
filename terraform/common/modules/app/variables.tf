
variable "module_charts" {
  type = "string"
}
variable "app_namespace" {
  type = "string"
}

# creates an implicit dependency towars module eks
variable "infra_namespace" {
  type = "string"
}

variable "gateway_subnet_ids"{
  type = list(string)
}
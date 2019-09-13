

provider "helm" {
  version        = "~> 0.10.0"
  install_tiller = true
  service_account = "tiller"
  namespace = "infra"

}

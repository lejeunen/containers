provider "helm" {
  version = "~> 0.10.0"
  install_tiller = true
  service_account = "tiller"
  namespace = "infra"

}
resource "helm_release" "dashboard" {
  name = "dashboard"
  chart = "stable/kubernetes-dashboard"
  namespace = "kube-system"
  version = "0.8.0"
  keyring = ""


  set {
    name = "rbac.create"
    value = true
  }
}
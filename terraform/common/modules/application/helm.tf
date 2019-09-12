provider "helm" {
  version        = "~> 0.10.0"
  install_tiller = true
  service_account = "tiller"
}

resource "helm_release" "container1" {
  name      = "container1"
  chart     = "${var.module_charts}/container1"
  namespace = var.app_namespace


  set {
    name  = "image.tag"
    value = "latest"
  }

  set {
    name  = "image.repository"
    value = "lejeunen/container1"
  }


  provisioner "local-exec" {
    command = "helm test container1"
  }
}
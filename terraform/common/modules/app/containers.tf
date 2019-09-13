provider "helm" {
  version = "~> 0.10.0"
  install_tiller = true
  service_account = "tiller"
  namespace = "infra"

}

resource "helm_release" "container1" {
  name = "container1"
  chart = "${var.module_charts}/container1"
  namespace = var.app_namespace

  set {
    name = "image.tag"
    value = "latest"
  }

  set {
    name = "image.repository"
    value = "lejeunen/container1"
  }
}

resource "helm_release" "container2" {
  name = "container2"
  chart = "${var.module_charts}/container2"
  namespace = var.app_namespace

  set {
    name = "image.tag"
    value = "latest"
  }

  set {
    name = "image.repository"
    value = "lejeunen/container2"
  }
}

resource "helm_release" "container3" {
  name = "container3"
  chart = "${var.module_charts}/container3"
  namespace = var.app_namespace

  set {
    name = "image.tag"
    value = "latest"
  }

  set {
    name = "image.repository"
    value = "lejeunen/container3"
  }


}
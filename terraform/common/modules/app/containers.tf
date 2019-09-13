
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
}
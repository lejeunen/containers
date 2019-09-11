locals {
  env          = "dev"
  cluster_name = "${local.env}_eks"
  subnet_count = 2
}


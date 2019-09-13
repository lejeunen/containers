module "network" {
  source = "../common/modules/network"

  env = local.env
  cluster_name = local.cluster_name
  subnet_count = local.subnet_count
}

module "eks" {
  source = "../common/modules/eks"

  vpc_id = module.network.vpc_id
  env = local.env
  cluster_name = local.cluster_name
  app_subnet_ids = module.network.app_subnet_ids
  keypair_name = local.keypair_name
  worker_ami = local.worker_ami
}

module "infra" {
  source = "../common/modules/infra"

  env = local.env
  cluster_name = local.cluster_name
  eks_cluster_id = module.eks.eks_cluster_id # dependency towards module eks
}

module "app" {
  source = "../common/modules/app"

  module_charts = "../../system/"
  app_namespace = local.app_namespace
  infra_namespace = module.infra.infra_namespace # dependency towards module infra
}
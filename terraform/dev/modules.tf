module "network" {
  source = "../common/modules/network"

  // inputs from modules
  env          = local.env
  cluster_name = local.cluster_name
  subnet_count = local.subnet_count
}

module "eks" {
  source = "../common/modules/eks"

  // inputs from modules
  vpc_id         = module.network.vpc_id
  env            = local.env
  cluster_name = local.cluster_name
  app_subnet_ids = module.network.app_subnet_ids
  keypair_name = local.keypair_name
  worker_ami = local.worker_ami
}

module "post" {
  source = "../common/modules/application"

  // inputs from modules
  env          = local.env
  cluster_name = local.cluster_name
  module_charts = "../../system/"
  app_namespace = local.app_namespace
}
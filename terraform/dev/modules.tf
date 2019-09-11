module "network" {
  source = "../common/modules/network"

  // inputs from modules
  env          = local.env
  subnet_count = local.subnet_count
}

module "eks" {
  source = "../common/modules/eks"

  // inputs from modules
  vpc_id         = module.network.vpc_id
  env            = local.env
  app_subnet_ids = module.network.app_subnet_ids
}

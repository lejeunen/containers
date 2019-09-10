module "network" {
  source = "../common/modules/network"

  // inputs from modules
  env = local.env
}

module "eks" {
  source = "../common/modules/eks"

  // inputs from modules
  vpc_id = module.network.vpc_id
  env = local.env
}

module "security_groups" {
  source = "../common/modules/security_groups"

  // inputs from modules
  vpc_id = module.network.vpc_id
  env = local.env
}
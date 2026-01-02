module "networking" {
  source = "./modules/networking"

  vpc_cidr              = var.vpc_cidr
  azs                   = local.azs
  public_subnet_cidrs   = local.public_subnet_cidrs
  frontend_subnet_cidrs = local.frontend_subnet_cidrs
  backend_subnet_cidrs  = local.backend_subnet_cidrs
  db_subnet_cidrs       = local.db_subnet_cidrs
  tags                  = local.tags
}

module "security" {
  source = "./modules/security"

  vpc_id         = module.networking.vpc_id
  tags           = local.tags
  my_ip          = var.my_ip
  frontend_port  = var.frontend_port
  backend_port   = var.backend_port
  db_port        = var.db_port

  depends_on = [module.networking]  
}
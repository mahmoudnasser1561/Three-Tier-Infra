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

module "bastion" {
  source = "./modules/bastion"

  vpc_id            = module.networking.vpc_id
  public_subnet_id  = module.networking.public_subnets[0] 
  bastion_sg_id     = module.security.bastion_sg_id
  tags              = local.tags
  instance_type     = var.instance_type
  key_name          = var.key_name

  depends_on = [module.security]
}

module "loadbalancers" {
  source = "./modules/loadbalancers"

  vpc_id                    = module.networking.vpc_id
  public_subnets            = module.networking.public_subnets
  private_frontend_subnets  = module.networking.private_frontend_subnets
  alb_public_sg_id          = module.security.alb_public_sg_id
  internal_lb_sg_id         = module.security.internal_lb_sg_id
  tags                      = local.tags
  frontend_port             = var.frontend_port
  backend_port              = var.backend_port

  depends_on = [module.networking, module.security]
}
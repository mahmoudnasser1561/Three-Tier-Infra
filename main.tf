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

module "frontend" {
  source = "./modules/frontend"

  vpc_id               = module.networking.vpc_id
  private_subnets      = module.networking.private_frontend_subnets
  frontend_sg_id       = module.security.frontend_sg_id
  frontend_tg_arn      = module.loadbalancers.frontend_tg_arn
  tags                 = local.tags
  instance_type        = var.instance_type
  key_name             = var.key_name
  asg_min_size         = var.asg_min_size
  asg_max_size         = var.asg_max_size
  asg_desired_capacity = var.asg_desired_capacity

  depends_on = [module.loadbalancers]
}
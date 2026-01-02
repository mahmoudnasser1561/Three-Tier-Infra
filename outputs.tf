output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnets" {
  value = module.networking.public_subnets
}

output "private_frontend_subnets" {
  value = module.networking.private_frontend_subnets
}

output "bastion_sg_id" {
  value = module.security.bastion_sg_id
}

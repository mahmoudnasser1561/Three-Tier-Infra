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

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}

output "public_alb_dns" {
  value = module.loadbalancers.public_alb_dns
}

output "internal_alb_dns" {
  value = module.loadbalancers.internal_alb_dns
}

output "frontend_asg_name" {
  value = module.frontend.asg_name
}

output "sns_topic_arn" {
  value = module.monitoring.sns_topic_arn
}

output "backend_asg_name" {
  value = module.backend.asg_name
}

output "db_endpoint" {
  value = module.database.db_endpoint
}
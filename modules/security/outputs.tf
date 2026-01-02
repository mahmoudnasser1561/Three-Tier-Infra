output "alb_public_sg_id" {
  value = aws_security_group.alb_public.id
}

output "frontend_sg_id" {
  value = aws_security_group.frontend.id
}

output "internal_lb_sg_id" {
  value = aws_security_group.internal_lb.id
}

output "backend_sg_id" {
  value = aws_security_group.backend.id
}

output "db_sg_id" {
  value = aws_security_group.db.id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion.id
}
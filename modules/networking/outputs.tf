output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = [for s in aws_subnet.public : s.id]
}

output "private_frontend_subnets" {
  value = [for s in aws_subnet.private_frontend : s.id]
}

output "private_backend_subnets" {
  value = [for s in aws_subnet.private_backend : s.id]
}

output "private_db_subnets" {
  value = [for s in aws_subnet.private_db : s.id]
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}
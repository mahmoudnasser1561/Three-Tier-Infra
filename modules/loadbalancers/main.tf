resource "aws_lb" "public" {
  name               = "public-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_public_sg_id]
  subnets            = var.public_subnets

  tags = merge(var.tags, { Name = "public-alb" })
}

resource "aws_lb_target_group" "frontend" {
  name     = "frontend-tg"
  port     = var.frontend_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path     = "/health" 
    protocol = "HTTP"
    matcher  = "200-299"
  }

  tags = merge(var.tags, { Name = "frontend-tg" })
}

resource "aws_lb_listener" "public_http" {
  load_balancer_arn = aws_lb.public.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }
}

resource "aws_lb" "internal" {
  name               = "int-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.internal_lb_sg_id]
  subnets            = var.private_frontend_subnets 

  tags = merge(var.tags, { Name = "internal-alb" })
}

resource "aws_lb_target_group" "backend" {
  name     = "backend-tg"
  port     = var.backend_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path     = "/health" 
    protocol = "HTTP"
    matcher  = "200-299"
  }

  tags = merge(var.tags, { Name = "backend-tg" })
}

resource "aws_lb_listener" "internal_http" {
  load_balancer_arn = aws_lb.internal.arn
  port              = var.backend_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }
}
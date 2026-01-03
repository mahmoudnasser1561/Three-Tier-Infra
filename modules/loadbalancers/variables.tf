variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_frontend_subnets" {
  type = list(string)
}

variable "alb_public_sg_id" {
  type = string
}

variable "internal_lb_sg_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "frontend_port" {
  type = number
}

variable "backend_port" {
  type = number
}
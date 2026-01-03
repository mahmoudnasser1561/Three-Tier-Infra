variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string) 
}

variable "frontend_sg_id" {
  type = string
}

variable "frontend_tg_arn" {
  type = string 
}

variable "tags" {
  type = map(string)
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "asg_min_size" {
  type    = number
  default = 1
}

variable "asg_max_size" {
  type    = number
  default = 4
}

variable "asg_desired_capacity" {
  type    = number
  default = 2
}
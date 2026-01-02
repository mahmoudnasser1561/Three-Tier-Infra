variable "vpc_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "my_ip" {
  description = "IP for SSH access to bastion"
  type        = string
}

variable "frontend_port" {
  description = "Port for frontend app"
  type        = number
  default     = 80
}

variable "backend_port" {
  description = "Port for backend app"
  type        = number
  default     = 8080
}

variable "db_port" {
  description = "Port for DB"
  type        = number
  default     = 3306
}
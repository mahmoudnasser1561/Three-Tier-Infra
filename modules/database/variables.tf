variable "private_subnets" {
  type = list(string)
}

variable "db_sg_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "db_instance_type" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "DB username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "DB password"
  type        = string
  sensitive   = true
}

variable "db_port" {
  type = number
}
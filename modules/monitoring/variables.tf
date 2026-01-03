variable "tags" {
  type = map(string)
}

variable "notification_email" {
  description = "Email for SNS notifications"
  type        = string
}

variable "frontend_asg_name" {
  description = "Frontend ASG for alarms"
  type        = string
}

variable "backend_asg_name" {
  type    = string
  default = ""
}

variable "db_identifier" {
  type    = string
  default = ""
}

variable "cpu_threshold" {
  type    = number
  default = 70
}
variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string 
}

variable "bastion_sg_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "instance_type" {
  description = "EC2 instance type for bastion"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "associate_public_ip" {
  type    = bool
  default = true
}

variable "iam_instance_profile" {
  type = string
}
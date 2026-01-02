variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "subnet_cidrs" {
  description = "Subnet CIDR blocks"
  type        = map(string)
  default = {
    public1   = "10.0.1.0/24"
    public2   = "10.0.2.0/24"
    frontend1 = "10.0.3.0/24"
    frontend2 = "10.0.4.0/24"
    backend1  = "10.0.5.0/24"
    backend2  = "10.0.6.0/24"
    db1       = "10.0.7.0/24"
    db2       = "10.0.8.0/24"
  }
}

variable "bastion_key_name" {
  description = "EC2 key pair for bastion"
  type        = string
  default     = "bastion-key"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "three-tier"
  }
}
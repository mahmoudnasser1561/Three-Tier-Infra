locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 2)  
  
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]  
  frontend_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  backend_subnet_cidrs  = ["10.0.5.0/24", "10.0.6.0/24"]
  db_subnet_cidrs      = ["10.0.7.0/24", "10.0.8.0/24"]

  tags = {
    Environment = var.env
    Project     = "three-tier-aws"
  }
}
## Architecture Overview

This project implements a production-style, modular, scalable and secure 3-tier AWS architecture using Terraform.

### Networking
- Custom VPC with CIDR 10.0.0.0/16
- Public subnets for:
  - ALB
  - Bastion host
- Private subnets for:
  - Frontend (EC2 / ASG)
  - Backend (EC2 / ASG)
  - Database (RDS)

### Security
- Bastion host used for SSH access
- No direct internet access to private subnets
- NAT Gateway for outbound access

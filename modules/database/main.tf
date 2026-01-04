resource "aws_db_subnet_group" "db" {
  name       = "db-subnet-group"
  subnet_ids = var.private_subnets

  tags = merge(var.tags, { Name = "db-subnet-group" })
}

resource "aws_db_instance" "db" {
  identifier              = "three-tier-db"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_type
  allocated_storage       = 20
  storage_type            = "gp2"
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  port                    = var.db_port
  multi_az                = true  
  publicly_accessible     = false
  vpc_security_group_ids  = [var.db_sg_id]
  db_subnet_group_name    = aws_db_subnet_group.db.name
  backup_retention_period = 7
  skip_final_snapshot     = true 

  tags = merge(var.tags, { Name = "three-tier-db" })
}

resource "aws_db_parameter_group" "db" {
  name   = "three-tier-db-params"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  tags = merge(var.tags, { Name = "db-params" })
}
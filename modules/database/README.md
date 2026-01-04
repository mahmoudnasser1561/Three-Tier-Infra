# Database Module

Creates RDS MySQL instance in private subnets, with subnet group and params.

Inputs: private_subnets, db_sg_id, tags, db_instance_type, db_name, db_username, db_password, db_port.

Outputs: db_endpoint (for connection), db_identifier (for monitoring).
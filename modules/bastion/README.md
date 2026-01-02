# Bastion Module

Creates a bastion EC2 host in public subnet for secure access to private resources.

Inputs: vpc_id, public_subnet_id, bastion_sg_id, tags, instance_type, key_name.

Outputs: bastion_public_ip (use for SSH).
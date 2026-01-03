# Backend Module

Creates launch template and ASG for backend servers, attached to internal ALB.

Inputs: vpc_id, subnets, sg_id, tg_arn, tags, instance_type, key_name, asg sizes, backend_port.

Outputs: asg_name.
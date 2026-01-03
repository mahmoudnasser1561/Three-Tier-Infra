# Frontend Module

Creates launch template and ASG for frontend web servers, attached to public ALB.

Inputs: vpc_id, subnets, sg_id, tg_arn, tags, instance_type, key_name, asg sizes.

Outputs: asg_name.
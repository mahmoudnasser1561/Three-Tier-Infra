# Loadbalancers Module

Creates public and internal ALBs with target groups and listeners.

Inputs: vpc_id, subnets, sg_ids, tags, ports.

Outputs: ALB DNS names, TG ARNs (for ASG attachments).
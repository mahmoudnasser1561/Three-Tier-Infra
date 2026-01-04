data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  iam_instance_profile = var.iam_instance_profile
  vpc_security_group_ids      = [var.bastion_sg_id]
  associate_public_ip_address = var.associate_public_ip

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    echo "Bastion host ready" > /var/log/user-data.log
  EOF

  tags = merge(var.tags, { Name = "bastion-host" })
}

resource "aws_eip" "bastion" {
  instance = aws_instance.bastion.id
  domain   = "vpc"
  tags     = merge(var.tags, { Name = "bastion-eip" })
}
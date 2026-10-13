# -----------------------------------
# EC2 A - Frontend / Bastion
# -----------------------------------

resource "aws_instance" "frontend" {
  ami                         = var.ubuntu_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.frontend_public.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.frontend.id
  ]

  key_name = aws_key_pair.devops.key_name

  root_block_device {
    volume_size = 16
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.project_name}-frontend"
  }
}

# -----------------------------------
# EC2 B - Backend
# -----------------------------------

resource "aws_instance" "backend" {
  ami                         = var.ubuntu_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private.id
  associate_public_ip_address = false

  vpc_security_group_ids = [
    aws_security_group.backend.id
  ]

  key_name = aws_key_pair.devops.key_name

  root_block_device {
    volume_size = 16
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.project_name}-backend"
  }
}

# -----------------------------------
# EC2 C - Database
# -----------------------------------

resource "aws_instance" "database" {
  ami                         = var.ubuntu_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private.id
  associate_public_ip_address = false

  vpc_security_group_ids = [
    aws_security_group.database.id
  ]

  key_name = aws_key_pair.devops.key_name

  root_block_device {
    volume_size = 16
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.project_name}-database"
  }
}
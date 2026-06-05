# Bastion Host Security Group
resource "aws_security_group" "bastion_sg" {
  name = "bastion-host-sg"
  description = "Bastion Host Security Group"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow SSH to my ip"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-host-sg"
  }
}

# ALB 1 Security Group
resource "aws_security_group" "alb1_sg" {
  name        = "alb1_sg"
  description = "Public ALB (Web tier), Internet facing"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Forward traffic to targets"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb1-sg"
  }
}

# ALB 2 Security Group
resource "aws_security_group" "alb2_sg" {
  name   = "alb2_sg"
  vpc_id = var.vpc_id

  ingress {
    description = "HTTP from ALB1"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web_ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb2-sg"
  }
}

# ASG 1 (Web) Security Group
resource "aws_security_group" "web_ec2_sg" {
  name        = "web-ec2-sg"
  description = "Web ASG EC2 security group"
  vpc_id      = var.vpc_id

  # Allow HTTP from Public ALB (ALB-1)
  ingress {
    description     = "HTTP from ALB1"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb1_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-ec2-sg"
  }
}

# ASG 2 (App) Security Group
resource "aws_security_group" "app_ec2_sg" {
  name        = "app-ec2-sg"
  description = "App ASG EC2 security group"
  vpc_id      = var.vpc_id

  # Allow HTTP from Internal ALB (ALB-2)
  ingress {
    description     = "HTTP from ALB2"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb2_sg.id]
  }

  # Allow Bastion Host
  ingress {
    description = "SSH from bastion host"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-ec2-sg"
  }
}

# DB Security Group
resource "aws_security_group" "db_sg"{
  name = "rds-sg"
  description = "RDS Security Group"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow MySQL from App ASG"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}

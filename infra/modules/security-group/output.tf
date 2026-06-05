# Output ALB 1 SG ID
output "alb1_sg_id"{
    value = aws_security_group.alb1_sg.id
}

# Output ALB 2 SG ID
output "alb2_sg_id"{
    value = aws_security_group.alb2_sg.id
}

# Output Web SG ID
output "web_ec2_sg_id" {
  value = aws_security_group.web_ec2_sg.id
}

# Output App SG ID
output "app_ec2_sg_id"{
    value = aws_security_group.app_ec2_sg.id
}

# Bastion Host SG ID
output "bastion_sg_id"{
    value = aws_security_group.bastion_sg.id
}

# RDS SG ID
output "db_sg_id"{
    value = aws_security_group.db_sg.id
}
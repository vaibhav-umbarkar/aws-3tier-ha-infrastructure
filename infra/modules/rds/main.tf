# RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
    name       = "rds-subnet-group"
    subnet_ids = var.db_private_subnet_ids

    tags = {
        Name = "rds-subnet-group"
    }
}

# RDS Creation
resource "aws_db_instance" "rds"{
    identifier = "my-rds-instance"
    engine = "mysql"
    instance_class = "db.t3.micro"

    allocated_storage = 20
    storage_type = "gp2"

    db_name = "appdb"
    username = "admin"
    password = var.db_password

    publicly_accessible = false
    multi_az = true
    skip_final_snapshot = true
    vpc_security_group_ids = [var.db_sg_id]
    db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name

    tags = {
        Name = "rds_instance"
    }
}

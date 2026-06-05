# Bastain Host
resource "aws_instance" "bastion_host"{
    ami = var.bastion_ami_id
    instance_type = var.bastion_instance_type
    subnet_id = var.public_subnet_id
    key_name = var.bastion_key
    associate_public_ip_address = true

    vpc_security_group_ids = [var.bastion_host_sg_id]

    tags = {
        Name = "bastion-host"
    }
}
# AMI ID
variable "bastion_ami_id"{
    type = string
}

# Instance type
variable "bastion_instance_type"{
    type = string
} 

# Public subnet ID
variable "public_subnet_id"{
    type = string
}

# Pem key name
variable "bastion_key"{
    type = string
    default = "bastion-key"
}

# Bastion host security group ID
variable "bastion_host_sg_id"{
    type = string
}

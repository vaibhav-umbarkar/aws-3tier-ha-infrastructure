# VPC ID
variable "vpc_id"{
    type = string
}

# ALB Security Group ID
variable "alb1_sg_id"{
    type = string
}

variable "alb2_sg_id"{
    type = string
}

# Public Subnets
variable "public_subnet_ids"{
    type = list(string)
}

# Private Subnets
variable "app_private_subnet_ids"{
    type = list(string)
}
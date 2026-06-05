# VPC ID
variable "vpc_id"{
    type = string
}

# Internet Gateway ID
variable "ig_id"{
    type = string
}

# NAT ID
variable "nat_id"{
    type = string
}

# Public Subnets IDs
variable "public_subnet_ids"{
    type = list(string)
}

# App Private Subnets IDs
variable "app_private_subnet_ids"{
    type = list(string)
}

# DB Private Subnet IDs
variable "db_private_subnet_ids"{
    type = list(string)
}

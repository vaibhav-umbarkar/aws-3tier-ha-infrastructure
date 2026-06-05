# VPC ID
variable "vpc_id"{
    type = string
}

# ALB Target Group ARNs
variable "web_tg_arn"{
    type = string
}

variable "app_tg_arn"{
    type = string
}


# Subnet IDs
variable "public_subnet_ids"{
    type = list(string)
}

variable "private_subnet_ids"{
    type = list(string)
}


# Web Instance
variable "web_ami_id"{
    type = string
}

# Instance type
variable "web_instance_type"{
    type = string
}

# Key name
variable "web_key"{
    type = string
    default = "web-key"
}

# Security group ID
variable "web_ec2_sg_id"{
    type = string
}


# App Instance
variable "app_ami_id"{
    type = string
}

# Instance type
variable "app_instance_type"{
    type = string
}

# Key name
variable "app_key" {
  type = string
  default = "app-key"
}

# Security group ID
variable "app_ec2_sg_id" {
  type = string
}

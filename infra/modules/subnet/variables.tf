# VPC ID
variable "vpc_id"{
    type = string
}

# Public Subnet CIDR & AZ (Web)
variable "public_subnet" {
    type = map(object({
        cidr = string
        az = string
    }))
}

# Private Subnet CIRD & AZ (App)
variable "server_private_subnet" {
    type = map(object({
        cidr = string
        az = string
    }))
}

# Private Subnet CIRD & AZ (DB)
variable "db_private_subnet" {
    type = map(object({
        cidr = string
        az = string
    }))
}

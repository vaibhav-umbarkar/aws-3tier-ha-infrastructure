# DB Subnet
variable "db_private_subnet_ids" {
    type = list(string)
}

# DB Security Group
variable "db_sg_id" {
    type = string
}

# DB Password
variable "db_password" {
    type = string
}

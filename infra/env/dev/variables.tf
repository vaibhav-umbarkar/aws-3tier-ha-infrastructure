variable "region" {}
variable "vpc_cidr" {}

variable "public_subnet" {
    type = map(object({
        cidr = string
        az = string
    }))
}
variable "server_private_subnet" {
    type = map(object({
        cidr = string
        az = string
    }))
}
variable "db_private_subnet" {
    type = map(object({
        cidr = string
        az = string
    }))
}

variable "my_ip_for_bastion"{} 
variable "web_ami_id" {} 
variable "app_ami_id" {}
variable "web_instance_type" {}
variable "app_instance_type" {}
variable "db_password" {}
variable "bastion_ami_id" {}
variable "bastion_instance_type" {}

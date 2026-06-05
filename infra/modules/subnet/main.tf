# 2 Public Subnets for Servers
resource "aws_subnet" "public_subnet"{
    for_each = var.public_subnet
    
    vpc_id = var.vpc_id
    cidr_block = each.value.cidr
    availability_zone = each.value.az

    map_public_ip_on_launch = true

    tags = {
        Name = "${each.key}"
    }
}

# 2 Private Subnets for Servers
resource "aws_subnet" "app_private_subnet"{
    for_each = var.server_private_subnet

    vpc_id = var.vpc_id
    cidr_block = each.value.cidr
    availability_zone = each.value.az

    map_public_ip_on_launch = false

    tags = {
        Name = "${each.key}"
    }
}

# 2 Private Subnets for Database
resource "aws_subnet" "db_private_subnet"{
    for_each = var.db_private_subnet

    vpc_id = var.vpc_id
    cidr_block = each.value.cidr
    availability_zone = each.value.az

    map_public_ip_on_launch = false

    tags = {
        Name = "${each.key}"
    }
}

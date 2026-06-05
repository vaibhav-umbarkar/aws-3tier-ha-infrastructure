# List Subnets ID => Map
locals {
  public_subnet_map = {
    for idx, subnet_id in var.public_subnet_ids :
    idx => subnet_id
  }

  app_private_subnet_map = {
    for idx, subnet_id in var.app_private_subnet_ids :
    idx => subnet_id
  }

  db_private_subnet_map = {
    for idx, subnet_id in var.db_private_subnet_ids :
    idx => subnet_id
  }
}


# Public Route Table
resource "aws_route_table" "public_rt"{
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.ig_id
    }
    tags = {
        Name = "public-rt"
    }
}

# Public RT Association
resource "aws_route_table_association" "public_assoc"{
    for_each = local.public_subnet_map
    subnet_id = each.value
    route_table_id = aws_route_table.public_rt.id
}


# App Private Route Table
resource "aws_route_table" "app_private_rt"{
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = var.nat_id
    }
    tags = {
        Name = "app-private-rt"
    }
}

# App Private RT Association
resource "aws_route_table_association" "private_assoc1"{
    for_each = local.app_private_subnet_map
    subnet_id = each.value
    route_table_id = aws_route_table.app_private_rt.id
}

# DB Private Route Table
resource "aws_route_table" "db_private_rt"{
    vpc_id = var.vpc_id
    tags = {
        Name = "db-private-rt"
    }
}

# DB Private RT Association
resource "aws_route_table_association" "private_assoc2"{
    for_each = local.db_private_subnet_map
    subnet_id = each.value
    route_table_id = aws_route_table.db_private_rt.id
}

# Output Public Subnets IDs
output "public_subnet_ids"{
    value = values(aws_subnet.public_subnet)[*].id
}

# Output App Private Subnets IDs
output "app_private_subnet_ids"{
    value = values(aws_subnet.app_private_subnet)[*].id
}

# Output DB Private Subnets IDs
output "db_private_subnet_ids"{
    value = values(aws_subnet.db_private_subnet)[*].id
}
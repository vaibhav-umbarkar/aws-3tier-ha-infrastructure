# Elastic IP
resource "aws_eip" "nat_eip"{
    domain = "vpc"
    tags = {
        Name = "nat-eip"
    }
}

# Internet Gateway
resource "aws_nat_gateway" "nat"{
    allocation_id = aws_eip.nat_eip.id
    subnet_id = var.public_subnet_ids[0]
    tags = {
        Name = "nat-gateway"
    }
}

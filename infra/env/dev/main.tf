# Import VPC Module
module "vpc"{
    source = "../../modules/vpc"
    vpc_cidr = var.vpc_cidr
}

# Import Subnets Module
module "subnet"{
    source = "../../modules/subnet"
    vpc_id = module.vpc.vpc_id
    public_subnet = var.public_subnet
    server_private_subnet = var.server_private_subnet
    db_private_subnet = var.db_private_subnet
}

# Import IG
module "ig"{
    source = "../../modules/ig"
    vpc_id = module.vpc.vpc_id
}

# Import NAT Module
module "nat"{
    source = "../../modules/nat"
    public_subnet_ids = module.subnet.public_subnet_ids
}

# Import Route Table Module
module "route-table"{
    source = "../../modules/route-table"
    vpc_id = module.vpc.vpc_id

    ig_id = module.ig.ig_id
    nat_id = module.nat.nat_gateway_id
    
    public_subnet_ids = module.subnet.public_subnet_ids
    app_private_subnet_ids = module.subnet.app_private_subnet_ids
    db_private_subnet_ids = module.subnet.db_private_subnet_ids
}

# Import Security Group Module
module "security_group"{
    source = "../../modules/security-group"
    vpc_id = module.vpc.vpc_id
    my_ip = var.my_ip_for_bastion
}

# Import ALB 1 & 2
module "alb"{
    source = "../../modules/alb"
    vpc_id = module.vpc.vpc_id
    
    alb1_sg_id = module.security_group.alb1_sg_id
    alb2_sg_id = module.security_group.alb2_sg_id

    public_subnet_ids = module.subnet.public_subnet_ids
    app_private_subnet_ids = module.subnet.app_private_subnet_ids
}

# Import ASG Module
module "asg"{
    source = "../../modules/asg"
    vpc_id = module.vpc.vpc_id

    web_ami_id = var.web_ami_id
    web_instance_type = var.web_instance_type

    app_ami_id = var.app_ami_id
    app_instance_type = var.app_instance_type

    # Web & App SG
    web_ec2_sg_id = module.security_group.web_ec2_sg_id
    app_ec2_sg_id = module.security_group.app_ec2_sg_id
    
    web_tg_arn = module.alb.web_tg_arn
    app_tg_arn = module.alb.app_tg_arn
    
    public_subnet_ids = module.subnet.public_subnet_ids
    private_subnet_ids = module.subnet.app_private_subnet_ids
}

# Import RDS Module
module "rds"{
    source = "../../modules/rds"
    db_password = var.db_password

    db_private_subnet_ids = module.subnet.db_private_subnet_ids
    db_sg_id = module.security_group.db_sg_id
}

# Import Bastion Host (EC2)
module "bastion-host"{
    source = "../../modules/bastion-host"
    
    bastion_ami_id = var.bastion_ami_id
    bastion_instance_type = var.bastion_instance_type

    public_subnet_id = module.subnet.public_subnet_ids[0]
    bastion_host_sg_id = module.security_group.bastion_sg_id
}


# Output ALB 1 DNS Name/URL
output "alb_dns_name"{
    value = module.alb.loadbalancerdns
}

region = "ap-south-1" # Mumbai Region
vpc_cidr = "10.0.0.0/16" # VPC CIDR

# Declare public subnet cidr & az (Web) var
public_subnet = {
    public_sub1 = {
        cidr = "10.0.1.0/24"
        az = "ap-south-1a"
    }

    public_sub2 = {
        cidr = "10.0.2.0/24"
        az = "ap-south-1b"
    }
}

# Declare private subnet cidr & az (App) var
server_private_subnet = {
    app_private_sub1 = {
        cidr = "10.0.3.0/24"
        az = "ap-south-1a"
    }

    app_private_sub2 = {
        cidr = "10.0.4.0/24"
        az = "ap-south-1b"
    }
}

# Declare private subnet cidr & az (DB) var
db_private_subnet = {
    db_private_sub1 = {
        cidr = "10.0.5.0/24"
        az = "ap-south-1a"
    }

    db_private_sub2 = {
        cidr = "10.0.6.0/24"
        az = "ap-south-1b"
    }
}

my_ip_for_bastion = "" # Your IP Address
web_ami_id = "" # Web AMI
app_ami_id = "" # App AMI
web_instance_type = "" # Web Instance Type
app_instance_type = "" # App Instance Type
db_password = "MyRdsPass_2026!" # DB Password 
bastion_ami_id = "" # Bastion-Host AMI
bastion_instance_type = "" # Bastion-Host Instance Type

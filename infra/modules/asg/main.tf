# Web - Launch Template
resource "aws_launch_template" "web_lt"{
    name_prefix = "web-lt"
    image_id = var.web_ami_id
    instance_type = var.web_instance_type
    vpc_security_group_ids = [var.web_ec2_sg_id]

    user_data = base64encode(file("../../scripts/web.sh"))

    tag_specifications {
        resource_type = "instance"

        tags = {
            Name = "web_instance_template"
        }
    }
}

# Web - Auto Scaling Group
resource "aws_autoscaling_group" "web_asg"{
    name = "web-asg"
    min_size = 1
    max_size = 3
    desired_capacity = 2
    vpc_zone_identifier = var.public_subnet_ids

    launch_template {
        id = aws_launch_template.web_lt.id
        version = "$Latest"
    } 

    target_group_arns = [var.web_tg_arn]

    tag {
        key = "Name"
        value = "web-asg"
        propagate_at_launch = true
    }

    lifecycle {
        create_before_destroy = true
    }
}

# App - Launch Tamplate
resource "aws_launch_template" "app_lt"{
    name_prefix = "app-lt"
    image_id = var.app_ami_id
    instance_type = var.app_instance_type
    key_name = var.app_key
    vpc_security_group_ids = [var.app_ec2_sg_id]

    user_data = base64encode(file("../../scripts/app.sh"))

    tag_specifications {
      resource_type = "instance"

      tags = {
        Name = "app_instance_template"
      }
    }
}

# App - Auto Scaling Group
resource "aws_autoscaling_group" "app_asg"{
    name = "app-asg"
    min_size = 1
    max_size = 3
    desired_capacity = 2
    vpc_zone_identifier = var.private_subnet_ids

    launch_template {
      id = aws_launch_template.app_lt.id
      version = "$Latest"
    }

    target_group_arns = [var.app_tg_arn]

    tag {
        key = "Name"
        value = "app-asg"
        propagate_at_launch = true
    }

    lifecycle {
        create_before_destroy = true
    }

}

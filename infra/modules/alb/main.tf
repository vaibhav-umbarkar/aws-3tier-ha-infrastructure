# ALB 1
resource "aws_lb" "alb1"{
    name = "alb-1"
    internal = false
    load_balancer_type = "application"

    security_groups = [var.alb1_sg_id]
    subnets = var.public_subnet_ids

    tags = {
        Name = "alb-1"
    }
}

# Target Group for ALB 1
resource "aws_lb_target_group" "web_tg"{
    name = "web-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    target_type = "instance"

    health_check {
        path = "/health"
    }
}

# Listener for ALB 1
resource "aws_lb_listener" "public_http"{
    load_balancer_arn = aws_lb.alb1.arn
    port = 80
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.web_tg.arn
    }
}



# ALB 2
resource "aws_lb" "alb2"{
    name = "alb-2"
    internal = true
    load_balancer_type = "application"

    security_groups = [var.alb2_sg_id]
    subnets = var.app_private_subnet_ids

    tags = {
        Name = "alb-2"
    }
}

# Target Group for ALB 2
resource "aws_lb_target_group" "app_tg" {
  name     = "app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id  = var.vpc_id
  target_type = "instance"

  health_check {
    path = "/health"
  }
}

# Listener for ALB 2
resource "aws_lb_listener" "internal_http" {
  load_balancer_arn = aws_lb.alb2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

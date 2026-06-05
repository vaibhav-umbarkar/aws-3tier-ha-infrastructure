# Public ALB outputs
output "alb1_arn" {
  description = "ARN of public ALB"
  value       = aws_lb.alb1.arn
}

output "alb1_dns_name" {
  description = "DNS name of public ALB"
  value       = aws_lb.alb1.dns_name
}

# Internal ALB outputs
output "alb2_arn" {
  description = "ARN of internal ALB"
  value       = aws_lb.alb2.arn
}

output "alb2_dns_name" {
  description = "DNS name of internal ALB"
  value       = aws_lb.alb2.dns_name
}

# Target group outputs (used by ASG module)
output "web_tg_arn" {
  description = "Target group ARN for web ASG (ALB 1)"
  value       = aws_lb_target_group.web_tg.arn
}

output "app_tg_arn" {
  description = "Target group ARN for app ASG (ALB 2)"
  value       = aws_lb_target_group.app_tg.arn
}

# ALB 1 DNS Name/URL
output "loadbalancerdns"{
  value = aws_lb.alb1.dns_name
}
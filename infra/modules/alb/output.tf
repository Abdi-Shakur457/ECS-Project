output "load_balancer_name" {
  description = "The name of the ALB"
  value       = aws_lb.app_alb.name
}

output "load_balancer_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.app_alb.arn
}

output "target_group_arn" {
  description = "The ARN of the ALB target group"
  value       = aws_lb_target_group.alb_target_group.arn
}

output "target_group_name" {
    description = "The name of the ALB target group"
    value       = aws_lb_target_group.alb_target_group.name
}

output "alb_sg_id" {
    description = "The ID of the ALB security group"
    value       = aws_security_group.alb_sg.id
}

output "alb_dns_name" {
  description = "the DNS name of the ALB"
  value = aws_lb.app_alb.dns_name
}

output "alb_zone_id" {
  description = "the zone ID of the ALB"
  value = aws_lb.app_alb.zone_id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = module.vpc.internet_gateway_id
}

output "cluster_name" {
  description = "The name of the ECS cluster"
  value       = module.ecs.cluster_name
}

output "task_definition_arn" {
  description = "The ARN of the ECS task definition"
  value       = module.ecs.task_definition_arn
}

output "service_name" {
  description = "The name of the ECS service"
  value       = module.ecs.service_name
}


output "target_group_arn" {
  description = "The ARN of the ALB target group"
  value       = module.alb.target_group_arn
}

output "target_group_name" {
  description = "The name of the ALB target group"
  value       = module.alb.target_group_name
}

output "alb_sg_id" {
  description = "The ID of the ALB security group"
  value       = module.alb.alb_sg_id
}

output "execution_role_arn" {
  description = "The ARN of the IAM role for ECS task execution"
  value       = module.iam.ecs_task_execution_role_arn

}

output "certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = module.acm.certificate_arn
}
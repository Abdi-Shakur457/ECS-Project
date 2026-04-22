variable "vpc_id" {
  description = "The ID of the VPC where the ALB is deployed"
  type = string
}

variable "public_subnet_ids" {
  description = "The IDs of the public subnets where the ALB is deployed"
  type = list(string)
}

variable "certificate_arn" {
    description = "The ARN of the ACM certificate"
    type = string
} 

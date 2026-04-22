variable "vpc_id" {
  type = string
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "target_group_arn" {
  type = string
}
variable "alb_sg_id" {
  type = string
}

variable "image_uri" {
  type = string
}

variable "image_tag" {
  type    = string
  default = "latest"
} 

variable "container_port" {
  type = number
}

variable "host_port" {
  type = number
}

variable "aws_iam_role_arn" {
  type = string
}

variable "ecs_cpu" {
  type = string
}

variable "ecs_memory" {
  type = string
}
## vpc variables

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "vpc_cidr_public1" {
  description = "CIDR block for the VPC Public subnet 1 "
  type        = string
}


variable "vpc_cidr_public2" {
  description = "CIDR block for the VPC Public subnet 2 "
  type        = string
}

variable "vpc_cidr_private1" {
  description = "CIDR block for the VPC Private subnet 1 "
  type        = string
}

variable "vpc_cidr_private2" {
  description = "CIDR block for the VPC Private subnet 2 "
  type        = string
}
## ecs variables 

variable "ecs_cpu" {
  description = "The number of CPU units used by the task"
  type        = string
}

variable "ecs_memory" {
  description = "The amount of memory (in MiB) used by the task"
  type        = string
}

variable "container_port" {
  description = "The port on which the container will listen"
  type        = number
}

variable "host_port" {
  description = "The port on the host to which the container port will be mapped"
  type        = number
}

variable "image_uri" {
  description = "The URI of the container image in ECR"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the ACM certificate"
  type        = string
}

variable "region" {
  description = "the region to deploy the infrastructure"
  type        = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  sensitive   = true
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "image_tag" {
  type    = string
  default = "latest"
}

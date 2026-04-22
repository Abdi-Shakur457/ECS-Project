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

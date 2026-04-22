## Output values for the VPC module

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.ecs_vpc.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [aws_subnet.public1.id, aws_subnet.public2.id]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [aws_subnet.private1.id, aws_subnet.private2.id]
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.ecs_igw.id
}

output "public_subnet1_id" {
  description = "The ID of the public subnet 1"
  value       = aws_subnet.public1.id
}

output "public_subnet2_id" {
  description = "The ID of the public subnet 2"
  value       = aws_subnet.public2.id
}

output "private_subnet1_id" {
  description = "The ID of the private subnet 1"
  value       = aws_subnet.private1.id
}

output "private_subnet2_id" {
  description = "The ID of the private subnet 2"
  value       = aws_subnet.private2.id
}
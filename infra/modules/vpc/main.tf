resource "aws_vpc" "ecs_vpc" {   ## creating a custom VPC 
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

    tags = {
        Name = "ECS VPC"
    }
}

## creating public and private subnets in the VPC
resource "aws_subnet" "public1" {  
  vpc_id                  = aws_vpc.ecs_vpc.id
  cidr_block              = var.vpc_cidr_public1
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

    tags = {
        Name = "Public Subnet 1"
    }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.ecs_vpc.id
  cidr_block              = var.vpc_cidr_public2
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = var.vpc_cidr_private1
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = var.vpc_cidr_private2
  availability_zone = "eu-west-2b"

  tags = {
    Name = "Private Subnet 2"
  }
}

## creating an internet gateway and attaching it to the VPC
resource "aws_internet_gateway" "ecs_igw" {
  vpc_id = aws_vpc.ecs_vpc.id

  tags = {
    Name = "ECS Internet Gateway"
  }
}
 
## ceating a route table for the public subnets and associating it with the public subnets

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.ecs_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ecs_igw.id
  } 
  tags = {
    Name = "Public Route Table"
  }
}

## associating the public route table with the public subnets

resource "aws_route_table_association" "assoc_public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "assoc_public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_rt.id
}

#create eip for nat gateway

resource "aws_eip" "nat" {
  domain = "vpc"
}

## creating a NAT gateway in the first public subnet and associating it with an elastic IP

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "ecs-nat"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.ecs_vpc.id
}


resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

## associating the private route table with the private subnets
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private1.id 
  route_table_id = aws_route_table.private_rt.id
  
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_rt.id
}


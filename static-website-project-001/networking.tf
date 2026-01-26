locals {
  common_tags = {
    ManagedBy = "Terraform"
  }
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = merge(local.common_tags, {
    Name = "my-project-vpc"
  })
}

resource "aws_subnet" "my-private-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = merge(local.common_tags, {
    Name = "my-project-private-subnet"
  })
}

resource "aws_subnet" "my-public-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name      = "my-project-public-subnet"
    ManagedBy = "Terraform"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name      = "my-project-internet-gateway"
    ManagedBy = "Terraform"
  }
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name      = "my-project-route-table"
    ManagedBy = "Terraform"
  }
}

resource "aws_route_table_association" "public-subnet-association" {
  subnet_id      = aws_subnet.my-public-subnet.id
  route_table_id = aws_route_table.route-table.id
}

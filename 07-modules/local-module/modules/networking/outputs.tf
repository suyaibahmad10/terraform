output "public_subnets" {
  value = local.public_subnets
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = { for key, subnet in aws_subnet.this : key => subnet.id }
}


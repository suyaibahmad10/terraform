

data "aws_region" "current" {}

# Get the different region from oveerriden provider with alias
data "aws_region" "different_region" {
  provider = aws.kix
}

output "current_region" {
  value = data.aws_region.current
}

output "different_region" {
  value = data.aws_region.different_region
}
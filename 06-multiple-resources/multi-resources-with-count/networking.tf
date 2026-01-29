locals {
  Project = "TerraformDemo"
}
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Project = local.Project
    Name    = local.Project
  }
}

resource "aws_subnet" "main_subnet" {
  count      = var.subnet_count
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Project = local.Project
    Name    = "${local.Project}-${count.index}"
  }
}
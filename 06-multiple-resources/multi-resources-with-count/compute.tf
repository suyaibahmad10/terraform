resource "aws_instance" "ec2_from_count" {
  count         = var.ec2_instance_count
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_subnet[count.index % var.subnet_count].id

  tags = {
    Project = local.Project
    Name    = "${local.Project}-EC2-${count.index}"
  }
}
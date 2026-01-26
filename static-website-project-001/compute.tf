resource "aws_instance" "ec2-instance" {
  ami                         = "ami-0ff5003538b60d5ec" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.my-public-subnet.id
  associate_public_ip_address = true
  # attach the security group to ec2 instance
  vpc_security_group_ids = [aws_security_group.ec2-sg-public-http-traffic.id]
  root_block_device {
    delete_on_termination = true
    volume_type           = "gp2"
    volume_size           = 10
  }

  tags = {
    Name      = "my-ec2-instance"
    ManagedBy = "Terraform"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [tags]
  }
}

# create a SG
resource "aws_security_group" "ec2-sg-public-http-traffic" {
  description = "SG allowing HTTP traffic on port 80 and 443"
  name        = "public-http-traffic-sg"
  vpc_id      = aws_vpc.vpc.id

}

# create ingress rule for port 80
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.ec2-sg-public-http-traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# create ingress rule for port 443
resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.ec2-sg-public-http-traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}
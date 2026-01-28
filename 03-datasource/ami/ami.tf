data "aws_ami" "image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"] # A pattern matching the AMI name
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "ubuntu_ami_id" {
  value = data.aws_ami.image
}

resource "aws_instance" "ec2-instance" {
  ami                         = data.aws_ami.image.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true
    volume_type           = "gp2"
    volume_size           = 10
  }
}
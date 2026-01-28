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

resource "aws_instance" "compute" {
  ami           = data.aws_ami.image.id
  instance_type = local.ec2_instance_type

  root_block_device {
    delete_on_termination = true
    volume_type           = local.volume_type
    volume_size           = local.volume_size
  }

  tags = local.common_tags
}
locals {
  project_owner = "terraform-project"
  cost_center   = "cc-123456"
  ManagedBy     = "Terraform"
}

locals {
  common_tags = {
    project_owners = local.project_owner
    cost_center    = local.cost_center
    managed_by     = local.ManagedBy
  }
}

locals {
  ec2_instance_type = "t3.micro"
  volume_type       = "gp2"
  volume_size       = 10
}
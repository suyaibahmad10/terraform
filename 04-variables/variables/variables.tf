variable "ec2_instance_type" {
  type    = string
  default = "t3.micro"
  description = "The instance type of ec2 instance"
  # validation is a nice feature to restrict the input values
  validation {
    condition = var.ec2_instance_type == "t2.micro" || var.ec2_instance_type == "t3.micro"
    error_message = "Only t2.micro and t3.micro are allowed"
  }
}

variable "ec2_volume_type" {
  type    = string
  default = "gp2"
  description = "The type of ec2 instance"
}

variable "ec2_volume_size" {
  type    = number
  default = 10
  description = "The size of ec2 instance"
}

# one better way is to use object type variable to group related variables
variable "ec2_volume_config" {
  type = object({
    volume_type = string
    volume_size = number
  })
    default = {
        volume_type = "gp2"
        volume_size = 10
    }
    description = "The volume configuration for ec2 instance"
}
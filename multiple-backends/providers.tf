// terraform block only recieves the constant values and not variables
terraform {
  // required_version is the version of Terraform required to
  # required_version = "1.7.0"


  // Configure the backend for storing the Terraform state
  backend "s3" {
      
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
terraform {

  backend "s3" {
    bucket = "tf-state-bucket-suyaib"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    # # Overrides "env:/" with "workspaces/"
    # workspace_key_prefix = "workspaces" 

  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
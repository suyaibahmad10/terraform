// terraform block only recieves the constant values and not variables
terraform {
  // required_version is the version of Terraform required to
  # required_version = "1.7.0"


  // Configure the backend for storing the Terraform state
  backend "s3" {
      bucket = "my-bucket-name" // this bucket must be created beforehand
      key = "terraform.tfstate" // any name for the key, it will pick statefile only and save it with this name
      region = "ap-south-1" // region where the S3 bucket is located and not aws provider region
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
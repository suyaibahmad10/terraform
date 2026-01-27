terraform {
  required_providers {
    aws = {
        source = "harshicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# default provider
provider "aws" {
  region = "us-west-2"
}

# Additional provider, can be referenced using alias
provider "aws" {
  region = "us-east-1"
  alias = "us-east"
}
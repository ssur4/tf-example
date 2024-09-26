terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-3"
}

# Create a VPC
resource "aws_vpc" "stu6_example" {
  cidr_block = "172.16.6.0/24"
  tags = {
    Name = "stu6-simple-vpc"
  }
}

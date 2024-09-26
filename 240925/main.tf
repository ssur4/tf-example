terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" { 
region = "ap-northeast-3"
}


resource "aws_instance" "simple" {
ami         = "ami-0a70c5266db4a6202"  #변경 ubuntu22.04 
instance_type = "t3.micro"
}

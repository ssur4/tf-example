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

# Create a Instance
resource "aws_instance" "stu6-simple" {
  ami                    = "ami-0a70c5266db4a6202"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  tags = {
    Name = "stu6-simple-server"
  }
  # 프로비저닝 시, 유저데이터를 사용하도록 설정
  #EOF 앞에 - 기호 사용 시, tab 사용이 가능
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, Terraform!!" > index.html
              nohup busybox httpd -f -p "${var.web_port}" &
              EOF
}

resource "aws_security_group" "instance" {
  name = "stu6-simple-weg-sg"
  ingress {
    from_port   = var.web_port
    to_port     = var.web_port
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

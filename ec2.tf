terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}  
resource "aws_security_group" "neelimasg" {
    name = "neelimasg"
    description = "create sg for instance"
    ingress  {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress  {
        from_port = 22
        to_port = 22
        protocol ="tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress  {
        from_port = 80
        to_port = 80
        protocol ="tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

  }
resource "aws_vpc" "neelimavpc" {
    cidr_block = ["10.0.0.0/16"]
    enable_dns_hostnames = true
    tags = {
      Name = "neelima_vpc"
    }
}
resource "aws_instance" "neelima" {
  ami           = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
  tags = {
  name = "Myinstance" }
  security_groups = [aws_security_group.neelimasg.name]
}

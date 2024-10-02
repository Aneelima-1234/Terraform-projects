#neelima created a vpc with subnet,ec2with security groups
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
  name        = "neelimasg"
  description = "create sg for instance"
  ingress {
    from_port = 80
    to_port   = 80
    protocol = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
    }
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_vpc" "neelimavpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name = "neelima_vpc"
    }
}
resource "aws_subnet" "neelimasubnet" {
    vpc_id = aws_vpc.neelimavpc.id
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "neelimasubnet"
    }
  
}
resource "aws_instance" "neelima" {
  ami           = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
  tags = {
  Name = "Myinstance" }
  security_groups = [aws_security_group.neelimasg.name]
}

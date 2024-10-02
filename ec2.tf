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
    ingress = {
        fromport = 80
        toport = 80
        protocol = "tcp"
        cidr = ["0.0.0.0/0"]
    }
    
    ingress = {
        fromport = 22
        toport = 22
        protocol ="tcp"
        cidr_block = ["0.0.0.0/0"]
    }

  }
resource "aws_instance" "neelima" {
  ami           = "ami-0dee22c13ea7a9a67"
  instance_type = "t3.micro"
  tags = {
  name = "Myinstance" }
  security_groups = [aws_security_group.neelimasg]
}

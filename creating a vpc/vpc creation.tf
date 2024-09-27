provider "aws" {
    region = "ap-south-1"
}
    variable "vpc_cidr" {
    default = "10.0.0.0/16"
    }
    variable "public_subnet_cidrs" {
        default = "10.0.0.1/16"
    }
    variable "private_subnet_cidrs" {
        default = "10.0.0.2/16"
    }
    resource "aws_vpc" "main" {
        cidr_block = var.vpc_cidr
        enable_dns_hostnames = true
        tags = {
            name = "kalyan vpc"
        }
    }
    resource "aws_internet_gateway" "main" {
        vpc_id = aws_vpc.main.id
        tags = {
            name = "kalyan igw"
        }
    }
    
    

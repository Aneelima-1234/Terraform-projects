resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"  # Change if needed
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_vpc" "prod_alvinchiew" {
  cidr_block           = "20.1.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name        = "VPC-prod-alvinchiew"
    Environment = "prod"
    Application = "alvinchiew-prod-vpc"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_subnet" "prod_alvinchiew_a" {
  vpc_id            = aws_vpc.prod_alvinchiew.id
  cidr_block        = "20.1.0.0/20"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "subnet-prod-alvinchiew-a"
  }
}

resource "aws_subnet" "prod_alvinchiew_b" {
  vpc_id            = aws_vpc.prod_alvinchiew.id
  cidr_block        = "20.1.16.0/20"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "subnet-prod-alvinchiew-b"
  }
}

resource "aws_subnet" "prod_alvinchiew_c" {
  vpc_id            = aws_vpc.prod_alvinchiew.id
  cidr_block        = "20.1.32.0/20"
  availability_zone = "ap-southeast-1c"

  tags = {
    Name = "subnet-prod-alvinchiew-c"
  }
}

resource "aws_internet_gateway" "prod_ig" {
  vpc_id = aws_vpc.prod_alvinchiew.id
  tags = {
    Name = "IG-prod"
  }
}

resource "aws_default_route_table" "prod_rtb" {
  default_route_table_id = aws_vpc.prod_alvinchiew.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_ig.id
  }

  tags = {
    Name = "RTB-prod"
  }
}

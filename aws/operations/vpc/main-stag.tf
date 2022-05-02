resource "aws_vpc" "stag_alvinchiew" {
  cidr_block           = "30.1.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name        = "VPC-stag-alvinchiew"
    Environment = "stag"
    Application = "alvinchiew-stag-vpc"
    Tier        = "Private"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_subnet" "stag_alvinchiew_a" {
  vpc_id            = aws_vpc.stag_alvinchiew.id
  cidr_block        = "30.1.0.0/20"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name    = "subnet-stag-alvinchiew-a"
    Network = "Private"
  }
}

resource "aws_subnet" "stag_alvinchiew_b" {
  vpc_id            = aws_vpc.stag_alvinchiew.id
  cidr_block        = "30.1.16.0/20"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "subnet-stag-alvinchiew-b"
  }
}

resource "aws_subnet" "stag_alvinchiew_c" {
  vpc_id            = aws_vpc.stag_alvinchiew.id
  cidr_block        = "30.1.32.0/20"
  availability_zone = "ap-southeast-1c"

  tags = {
    Name = "subnet-stag-alvinchiew-c"
  }
}

resource "aws_internet_gateway" "stag_ig" {
  vpc_id = aws_vpc.stag_alvinchiew.id
  tags = {
    Name = "IG-stag"
  }
}

resource "aws_default_route_table" "stag_rtb" {
  default_route_table_id = aws_vpc.stag_alvinchiew.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.stag_ig.id
  }

  tags = {
    Name = "RTB-stag"
  }
}

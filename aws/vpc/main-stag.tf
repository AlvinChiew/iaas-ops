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
    prevent_destroy = true
  }
}

resource "aws_subnet" "subnet_stag_alvinchiew_a" {
  vpc_id            = aws_vpc.stag_alvinchiew.id
  cidr_block        = "30.1.0.0/20"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "subnet-stag-alvinchiew-a"
  }
}

resource "aws_subnet" "subnet_stag_alvinchiew_b" {
  vpc_id            = aws_vpc.stag_alvinchiew.id
  cidr_block        = "30.1.16.0/20"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "subnet-stag-alvinchiew-b"
  }
}

resource "aws_subnet" "subnet_stag_alvinchiew_c" {
  vpc_id            = aws_vpc.stag_alvinchiew.id
  cidr_block        = "30.1.32.0/20"
  availability_zone = "ap-southeast-1c"

  tags = {
    Name = "subnet-stag-alvinchiew-c"
  }
}

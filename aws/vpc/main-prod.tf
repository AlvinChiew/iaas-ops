resource "aws_vpc" "prod_alvinchiew" {
  cidr_block           = "20.1.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name        = "VPC-prod-alvinchiew"
    Environment = "prod"
    Application = "alvinchiew-prod-vpc"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_subnet" "subnet_prod_alvinchiew_a" {
  vpc_id            = aws_vpc.prod_alvinchiew.id
  cidr_block        = "20.1.0.0/20"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "subnet-prod-alvinchiew-a"
  }
}

resource "aws_subnet" "subnet_prod_alvinchiew_b" {
  vpc_id            = aws_vpc.prod_alvinchiew.id
  cidr_block        = "20.1.16.0/20"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "subnet-prod-alvinchiew-b"
  }
}

resource "aws_subnet" "subnet_prod_alvinchiew_c" {
  vpc_id            = aws_vpc.prod_alvinchiew.id
  cidr_block        = "20.1.32.0/20"
  availability_zone = "ap-southeast-1c"

  tags = {
    Name = "subnet-prod-alvinchiew-c"
  }
}

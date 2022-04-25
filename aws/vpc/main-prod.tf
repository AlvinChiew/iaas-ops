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

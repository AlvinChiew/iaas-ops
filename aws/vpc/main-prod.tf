resource "aws_vpc" "prod-alvinchiew" {
  cidr_block           = "20.1.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name        = "VPC-production-alvinchiew"
    Environment = "production"
    Application = "alvinchiew-prod-vpc"
  }

  lifecycle {
    prevent_destroy = true
  }
}

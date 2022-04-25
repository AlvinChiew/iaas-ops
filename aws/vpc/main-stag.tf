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

terraform {
  backend "s3" {
    bucket = "alvinchiew-ops"
    key    = "terraform/cloudflare-ops.tfstate"
    region = "ap-southeast-1"
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {}

module "domain_alvinchiew" {
  source = "./domain/alvinchiew"
}

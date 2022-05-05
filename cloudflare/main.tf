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

provider "cloudflare" {
  email   = var.email
  api_key = var.api_key
  alias   = "default"
}

# module "dns" {
#   source = "./operations/dns"
#   providers = {
#     cloudflare = cloudflare.default
#   }
# }

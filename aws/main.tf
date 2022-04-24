terraform {
  backend "s3" {
    bucket = "alvinchiew-ops"
    key    = "terraform/iaas-ops.tfstate"
    region = "ap-southeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.11.0"
    }
  }

  required_version = ">= 1.0.0, < 2.0.0"
}

provider "aws" {
  region = "ap-southeast-1"
}

module "iam" {
  source = "./iam"
}

module "sso" {
  source = "./sso"
}

module "vpc" {
  source = "./vpc"
}

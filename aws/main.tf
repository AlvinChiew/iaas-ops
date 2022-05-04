terraform {
  backend "s3" {
    bucket = "alvinchiew-ops"
    key    = "terraform/aws-ops.tfstate"
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

module "alb" {
  source          = "./operations/alb"
  prod_vpc_id     = module.vpc.prod_vpc_id
  prod_sg_ids     = [module.vpc.prod_sg_id]
  prod_subnet_ids = [module.vpc.prod_subnet_a_id, module.vpc.prod_subnet_b_id, module.vpc.prod_subnet_c_id]
  stag_vpc_id     = module.vpc.stag_vpc_id
  stag_sg_ids     = [module.vpc.stag_sg_id]
  stag_subnet_ids = [module.vpc.stag_subnet_a_id, module.vpc.stag_subnet_b_id, module.vpc.stag_subnet_c_id]
}

module "ecr" {
  source = "./operations/ecr"
}

module "ecs_cluster" {
  source                = "./operations/ecs_cluster"
  prod_vpc_id           = module.vpc.prod_vpc_id
  prod_sg_id            = module.vpc.prod_sg_id
  stag_vpc_id           = module.vpc.stag_vpc_id
  stag_sg_id            = module.vpc.stag_sg_id
  instance_profile_name = module.iam.ecs_instance_role_name
  depends_on            = [module.iam, module.vpc]
}

module "iam" {
  source = "./operations/iam"
}

module "s3" {
  source = "./operations/s3"
}

module "sso" {
  source = "./operations/sso"
}

module "vpc" {
  source = "./operations/vpc"
}

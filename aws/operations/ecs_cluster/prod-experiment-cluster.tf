module "alvinchiew-experiment-cluster-prod" {
  source                    = "./module"
  team                      = "infra"
  ecs_cluster_name          = "alvinchiew-experiment"
  environment               = "prod"
  vpc_id                    = var.prod_vpc_id
  ecs_security_group_id     = var.prod_sg_id
  enable_container_insights = false
  instance_profile_name     = var.instance_profile_name
  instance_configuration = {
    "t2-micro" = {
      instance_type             = "t2.micro"
      desired_instance_capacity = 1
      min_instance_capacity     = 0
      max_instance_capacity     = 2
      protect_from_scale_in     = true
    }
  }
  resource_tags = {
    Team        = "infra"
    Owner       = "alvin"
    Category    = "infra"
    Project     = "infra"
    Environment = "prod"
  }
}

module "alvinchiew-experiment-cluster-stag" {
  source                    = "./module"
  team                      = "infra"
  ecs_cluster_name          = "alvinchiew-experiment"
  environment               = "stag"
  vpc_id                    = var.stag_vpc_id
  ecs_security_group_id     = var.stag_sg_id
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
    Environment = "stag"
  }
}

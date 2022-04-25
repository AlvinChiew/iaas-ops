module "experiment_ecr" {
  source          = "./module" # "github.com/alvinchiew/tf-ecr-module.git?ref=v1.0.1"
  repository_name = "alvinchiew-experiment"
  service_name    = "alvinchiew-experiment-service"
  team_name       = "infra"
}

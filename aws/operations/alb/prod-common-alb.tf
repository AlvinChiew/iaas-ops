# locals {
#   prod_certificate_arn = "arn:aws:acm:ap-southeast-1:502605353565:certificate/f950cac3-c5ef-436e-ad37-6208eb87a9ba"
# }

module "prod-common-alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "prod-common-alb"

  load_balancer_type = "application"

  vpc_id          = var.prod_vpc_id
  subnets         = var.prod_subnet_ids
  security_groups = var.prod_sg_ids

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        status_code  = "503"
      }
    }
  ]

  # https_listeners = [
  #   {
  #     port     = 443
  #     protocol        = "HTTPS"
  #     certificate_arn = local.prod_certificate_arn
  #     action_type = "fixed-response"
  #     fixed_response = {
  #       content_type = "text/plain"
  #       status_code  = "503"
  #     }
  #   }
  # ]

  # http_tcp_listeners = [
  #   {
  #     port        = 80
  #     protocol    = "HTTP"
  #     action_type = "redirect"
  #     redirect = {
  #       port     = "443"
  #       protocol    = "HTTPS"
  #       status_code = "HTTP_301"
  #     }
  #   }
  # ]

  tags = {
    Environment = "prod"
    Team        = "infra"
    Owner       = "alvin"
    Project     = "infra"
  }
}

// General
variable "environment" {
  type        = string
  description = "The environment for the ECS cluster."
  default     = "stag"
}

variable "region" {
  type        = string
  description = "The AWS region to create ECS cluster in."
  default     = "ap-southeast-1"
}

variable "team" {
  type        = string
  description = "The team for ECS cluster"
}

variable "pem_key_name" {
  type        = string
  description = "The name of the PEM key for your ECS cluster instance"
  default     = "pem-key-infra"
}

variable "ecs_cluster_name" {
  type        = string
  description = "The name for ECS cluster."
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to create `ECS cluster in."
}

variable "ecs_security_group_id" {
  type        = string
  description = "The ID of the security group use for ECS instances."
}

variable "instance_configuration" {
  type = map(object({
    instance_type             = string
    desired_instance_capacity = number
    min_instance_capacity     = number
    max_instance_capacity     = number
    protect_from_scale_in     = bool
  }))

  default = {
    "t3-micro" = {
      instance_type             = "t2.micro"
      desired_instance_capacity = 1
      min_instance_capacity     = 1
      max_instance_capacity     = 2
      protect_from_scale_in     = true
    }
  }
}

variable "resource_tags" {
  type        = map(any)
  description = "The tags for your resource"
}

variable "enable_container_insights" {
  type        = bool
  description = "To enable container insights which will cost you more money in AWS CloudWatch"
  default     = false
}

variable "instance_profile_name" {
  type        = string
  description = "The role profile name for ECS instances."
}

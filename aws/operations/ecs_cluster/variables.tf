variable "prod_vpc_id" {
  type        = string
  description = "VPC id in production environment"
}

variable "prod_sg_id" {
  type        = string
  description = "Security Group id in production environment"
}

variable "stag_vpc_id" {
  type        = string
  description = "VPC id in staging environment"
}

variable "stag_sg_id" {
  type        = string
  description = "Security Group id in staging environment"
}

variable "instance_profile_name" {
  type        = string
  description = "The role profile name for ECS instances."
}

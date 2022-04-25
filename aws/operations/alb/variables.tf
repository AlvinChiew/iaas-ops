variable "prod_vpc_id" {
  type        = string
  description = "VPC id in production environment"
}

variable "prod_sg_ids" {
  type        = list(string)
  description = "Security Group ids in production environment"
}

variable "prod_subnet_ids" {
  type        = list(string)
  description = "subnet ids in production environment"
}

variable "stag_vpc_id" {
  type        = string
  description = "VPC id in staging environment"
}

variable "stag_sg_ids" {
  type        = list(string)
  description = "Security Group ids in staging environment"
}

variable "stag_subnet_ids" {
  type        = list(string)
  description = "subnet ids in staging environment"
}

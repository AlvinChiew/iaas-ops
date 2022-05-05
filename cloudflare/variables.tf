variable "email" {
  type        = string
  description = "Cloudflare-registed email"
}

variable "api_key" {
  type        = string
  description = "Cloudflare-registed API key"
}

variable "site_domain" {
  type        = string
  default     = "alvinchiew.com"
  description = "Cloudflare-registed domain name"
}

data "cloudflare_zones" "domain" {
  filter {
    name = "alvinchiew.com"
  }
}
